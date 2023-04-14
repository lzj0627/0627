from rest_framework.authentication import BaseAuthentication
from rest_framework_jwt.utils import jwt_decode_handler
from rest_framework.exceptions import AuthenticationFailed

import jwt
from user.models import UserInfo


class CommonAuthentication(BaseAuthentication):
    def authenticate(self, request):
        token = request.META.get('HTTP_AUTHORIZATION')
        if not token:
            raise AuthenticationFailed('没有传token')
        try:
            payload = jwt_decode_handler(token)
            user = UserInfo.objects.filter(pk=payload.get('user_id')).first()
            return user, token
        except jwt.ExpiredSignature:
            raise AuthenticationFailed('token过期')
        except jwt.DecodeError:
            raise AuthenticationFailed('token认证失败')
        except jwt.InvalidTokenError:
            raise AuthenticationFailed('未知错误')

