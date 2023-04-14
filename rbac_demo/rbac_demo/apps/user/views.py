from django.shortcuts import render
from rest_framework.viewsets import ViewSet, ModelViewSet
from rest_framework.decorators import action
from user.serializer import UserLoginSerializer, UserSerializer, UserCreateUpdateSerializer
from utils.common_response import APIResponse
from utils.common_view import MyModelViewSet
from utils.common_authentication import CommonAuthentication
from utils.common_permission import CommonPermission
from .models import UserInfo
from django.conf import settings
from rest_framework.filters import SearchFilter
from utils.common_page import CommonPagination


# Create your views here.


class UserLogin(ViewSet):
    # 登陆接口不做认证
    authentication_classes = []

    @action(methods=['post'], detail=False)
    def login(self, request):
        res = UserLoginSerializer(data=request.data)
        res.is_valid(raise_exception=True)
        username = res.data.get('username')
        token = res.context.get('token')
        avatar = res.context.get('avatar')
        return APIResponse(username=username, avatar=str(avatar), token=token)


class UserInfoView(ViewSet):

    # 修改头像
    @action(methods=['post'], detail=False)
    def avatar(self, request):
        user = request.user
        user.avatar = request.data.get('file')
        user.save()
        avatar = settings.BACKEND_URL + 'media/' + str(user.avatar)
        return APIResponse(avatar=avatar)

    # 修改密码
    @action(methods=['post'], detail=False)
    def userinfo(self, request):
        user = request.user
        old, new, confirm = request.data.get('oldpass'), request.data.get('pass'), request.data.get('checkPass')
        if not user.check_password(old):
            return APIResponse(code=101, msg='旧密码不一致')
        if user.check_password(new):
            return APIResponse(code=101, msg='新密码不能与旧密码一致')
        if new and new == confirm:
            user.password = user.make_password(new)
            user.save()
            return APIResponse(msg='修改成功')
        return APIResponse(code=101, msg='两次密码不一致 或为空')


class UserView(MyModelViewSet):
    queryset = UserInfo.objects.filter(is_del=False)
    serializer_class = UserSerializer
    filter_backends = [SearchFilter]
    search_fields = ['username', 'mobile']
    authentication_classes = [CommonAuthentication]
    permission_classes = [CommonPermission]
    pagination_class = CommonPagination

    # 创建及更新使用指定序列化类
    def get_serializer_class(self):
        if self.action in ['create', 'update']:
            return UserCreateUpdateSerializer
        return UserSerializer

    def update(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, context={'update': True, 'id': instance.id})
        serializer.is_valid(raise_exception=True)
        return APIResponse(data=serializer.data)

    # 删除用户
    @action(methods=['post'], detail=False)
    def del_user(self, request):
        ids = request.data.get('ids')
        # 批量删除
        UserInfo.objects.filter(id__in=ids).delete()
        return APIResponse()

    @action(methods=['post'], detail=False)
    def avatar(self, request):
        user = request.user
        user.avatar = request.data.get('file')
        user.save()
        avatar = settings.BACKEND_URL + 'media/' + str(user.avatar)
        return APIResponse(avatar=avatar)

    @action(methods=['post'], detail=False)
    def userinfo(self, request):
        user = request.user
        old, new, confirm = request.data.get('oldpass'), request.data.get('pass'), request.data.get('checkPass')
        if not user.check_password(old):
            return APIResponse(code=101, msg='旧密码不一致')
        if user.check_password(new):
            return APIResponse(code=101, msg='新密码不能与旧密码一致')
        if new and new == confirm:
            user.password = user.make_password(new)
            user.save()
            return APIResponse(msg='修改成功')
        return APIResponse(code=101, msg='两次密码不一致 或为空')
