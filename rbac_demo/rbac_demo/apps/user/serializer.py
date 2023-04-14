from rest_framework import serializers
from .models import UserInfo
from rest_framework_jwt.utils import jwt_payload_handler, jwt_encode_handler, jwt_decode_handler
from django.db.models import Q
from rest_framework.exceptions import APIException
from django.conf import settings
from permission.serializer import RoleSerializer


class UserLoginSerializer(serializers.ModelSerializer):
    username = serializers.CharField()
    password = serializers.CharField()

    class Meta:
        model = UserInfo
        fields = ['username', 'password']

    def _get_user(self, attrs):
        username = attrs.get('username')
        password = attrs.get('password')
        user = UserInfo.objects.filter(Q(username=username) | Q(email=username) | Q(mobile=username)).first()
        if not user:
            raise APIException(detail='用户不存在')
        if not user.status:
            raise APIException(detail='用户已被锁定 请联系管理员')
        if user.check_password(password):
            return user
        raise APIException(detail='密码错误')

    def _get_token(self, user):
        pay_load = jwt_payload_handler(user)
        token = jwt_encode_handler(pay_load)
        return token

    def validate(self, attrs):
        user = self._get_user(attrs)
        token = self._get_token(user)
        self.context['token'] = token
        self.context['avatar'] = settings.BACKEND_URL + 'media/' + str(user.avatar)
        print(self.context.get('avatar'))
        self.context['user'] = user.username
        return attrs


class UserSerializer(serializers.ModelSerializer):
    role_list = RoleSerializer(source='roles', many=True)

    class Meta:
        model = UserInfo
        fields = ['id', 'username', 'mobile', 'email', 'avatar', 'dept', 'gender', 'value', 'gender_name', 'status', 'date_joined', 'last_login', 'job', 'roles', 'role_list']


class UserCreateUpdateSerializer(serializers.ModelSerializer):
    username = serializers.CharField()
    mobile = serializers.CharField(max_length=11)

    class Meta:
        model = UserInfo
        fields = ['id', 'username', 'mobile', 'gender', 'status', 'dept', 'roles', 'job', 'email']

    def validate(self, attrs):
        mobile = attrs.get('mobile')
        username = attrs.get('username')
        email = attrs.get('email')
        is_mobile = UserInfo.objects.filter(mobile=mobile).first()
        is_user = UserInfo.objects.filter(username=username).first()
        if self.context.get('update') and self.context.get('id') == is_user.id == is_mobile.id:
            return attrs
        if is_user or is_mobile:
            raise APIException('用户名或手机号已存在')
        return attrs

    def create(self, validated_data):
        # username = validated_data.get('username')
        # if UserInfo.objects.filter(username=username):
        #     raise APIException('用户名以存在')
        validated_data['password'] = '123'
        job_list = validated_data.pop('job')
        role_list = validated_data.pop('roles')
        user = UserInfo.objects.create_user(**validated_data)
        user.job.set(job_list)
        user.roles.set(role_list)
        user.save()
        return user



