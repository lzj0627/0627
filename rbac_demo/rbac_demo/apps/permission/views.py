from django.shortcuts import render
from utils.common_view import MyModelViewSet
from .serializer import RoleSerializer, DeptSerializer, JobSerializer, MenuSerializer, MenuPermissionSerializer, \
    DeptAllSerializer, MenuAllSerializer
from .models import Roles, Dept, Job, Menu
from utils.common_authentication import CommonAuthentication
from utils.common_page import CommonPagination
from utils.common_response import APIResponse
from rest_framework.decorators import action
from utils.common_permission import CommonPermission
from rest_framework.filters import SearchFilter


# Create your views here.


class MenuView(MyModelViewSet):
    # 默认从目录开始序列化
    queryset = Menu.objects.filter(is_del=False, type=0)
    serializer_class = MenuSerializer
    permission_classes = [CommonPermission]

    def get_serializer_class(self):
        if self.action == 'all_menu':
            return MenuAllSerializer
        return super().get_serializer_class()

    def get_queryset(self):
        if self.action in ['update', 'destroy', 'retrieve']:
            return Menu.objects.filter(is_del=False)
        return super().get_queryset()

    # 重写list方法
    def list(self, request, *args, **kwargs):
        # 超级管理员有所有权限
        if request.user.is_superuser:
            menu_list = Menu.objects.filter(is_del=False, type=0)
            ser = MenuPermissionSerializer(instance=menu_list, many=True)
            menu_list = ser.data
            buttons = Menu.objects.filter(is_del=False, type=2)
            permission = [i.name for i in buttons]
        else:
            # 根据当前登录用户获取用户所有角色
            roles = request.user.roles.filter(status=True)
            # 定义目录列表 菜单列表 按钮列表
            ml_list = []
            menu_ids = []
            btn_list = []
            # 获取单个角色
            for role in roles:
                # 根据角色获取有权限的目录id flat表示以列表的形式 默认元祖
                ml_list += role.menus.filter(type=0, status=True).values_list('id', flat=True)
                # 根据角色获取有权限的菜单id
                menu_ids += role.menus.filter(type=1, status=True).values_list('id', flat=True)
                # 根据角色获取有权限的按钮id
                btn_list += role.menus.filter(type=2, status=True)
            # 将目录id去重后查出所有对象
            ml_list = Menu.objects.filter(id__in=list(set(ml_list)))
            # 交给序列化类 传个menu_ids 序列化的时候可以序列化指定的目录
            ser = MenuPermissionSerializer(instance=ml_list, many=True, context={'menu_ids': list(set(menu_ids))})
            menu_list = ser.data
            permission = list(set([i.permission for i in btn_list]))
        return APIResponse(data=menu_list, permission=permission)

    # 给前端菜单选择使用
    @action(methods=['get'], detail=False)
    def all(self, request):
        return super().list(request)

    # 给前端treeselect组件使用
    @action(methods=['get'], detail=False)
    def all_menu(self, request):
        return super().list(request)


class PermissionRoleView(MyModelViewSet):
    queryset = Roles.objects.filter(is_del=False)
    serializer_class = RoleSerializer
    pagination_class = CommonPagination
    permission_classes = [CommonPermission]

    # 给前端删除及批量删除使用
    @action(methods=['post'], detail=False)
    def del_roles(self, request):
        ids = request.data.get('ids')
        # 筛选出id在指定范围内的并删除
        Roles.objects.filter(id__in=ids).delete()
        return APIResponse()


class DeptView(MyModelViewSet):
    queryset = Dept.objects.filter(is_del=False, p_dept=None)
    serializer_class = DeptSerializer
    pagination_class = CommonPagination
    permission_classes = [CommonPermission]

    def get_queryset(self):
        if self.action in ['destroy', 'retrieve', 'update']:
            return Dept.objects.filter(is_del=False)
        return super().get_queryset()

    def get_serializer_class(self):
        if self.action == 'all_dept':
            return DeptAllSerializer
        return super().get_serializer_class()

    # 给前端菜单选择使用
    @action(methods=['get'], detail=False)
    def all_dept(self, request):
        return super().list(request)


class JobView(MyModelViewSet):
    queryset = Job.objects.filter(is_del=False)
    serializer_class = JobSerializer
    authentication_classes = [CommonAuthentication]
    permission_classes = [CommonPermission]
    filter_backends = [SearchFilter]
    search_fields = ['name']
    pagination_class = CommonPagination

    def get_queryset(self):
        if self.action == 'all':
            return Job.objects.filter(is_del=False, status=True)
        return super().get_queryset()

    @action(methods=['get'], detail=False)
    def all(self, request):
        return super().list(request)

    @action(methods=['post'], detail=False)
    def del_jobs(self, request):
        ids = request.data.get('ids')
        # 筛选出id在指定范围内的并删除
        Job.objects.filter(id__in=ids).delete()
        return APIResponse()
