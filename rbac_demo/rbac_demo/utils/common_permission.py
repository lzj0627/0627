
from rest_framework.permissions import BasePermission


class CommonPermission(BasePermission):
    def has_permission(self, request, view):
        auth = request.META.get('HTTP_AUTH')
        if request.user.is_superuser or request.method == 'GET':
            return True
        roles = request.user.roles.all()
        btn_list = []
        for role in roles:
            btn_list += role.menus.filter(type=2)
        user_per = list(set([i.name for i in btn_list]))
        if auth in user_per:
            return True
        self.message = '权限不足'
        return False
