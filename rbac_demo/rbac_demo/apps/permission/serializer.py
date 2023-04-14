from rest_framework import serializers
from .models import *


# 所有角色序列化类
class RoleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Roles
        fields = '__all__'


# 所有岗位序列化类
class JobSerializer(serializers.ModelSerializer):
    class Meta:
        model = Job
        fields = ['id', 'name', 'status', "dept", 'dept_name', 'create_time', 'value']


# 所有部门序列化类
class DeptSerializer(serializers.ModelSerializer):
    class Meta:
        model = Dept
        fields = ['id', 'name', 'p_dept', 'p_dept_name', 'user_count', 'status', 'create_time', 'job_list', 'child']

    child = serializers.SerializerMethodField()

    def get_child(self, obj):
        return DeptSerializer(instance=obj.dept_set.all(), many=True).data


class DeptAllSerializer(serializers.ModelSerializer):
    label = serializers.CharField(source='name')

    class Meta:
        model = Dept
        fields = ['id', 'label', 'children', 'job_list']

    children = serializers.SerializerMethodField()

    def get_children(self, obj):
        return DeptAllSerializer(instance=obj.dept_set.all(), many=True).data


# 菜单序列化类
class MenuSerializer(serializers.ModelSerializer):
    children = serializers.SerializerMethodField()

    class Meta:
        model = Menu
        fields = ['id', 'title', 'name', 'path', 'p_menu', 'status', 'permission', 'component', 'type', 'type_name', 'children']

    def get_children(self, obj):
        return MenuSerializer(instance=obj.menu_set.all(), many=True).data


class MenuAllSerializer(serializers.ModelSerializer):
    children = serializers.SerializerMethodField()
    label = serializers.CharField(source='title')

    class Meta:
        model = Menu
        fields = ['id', 'label', 'children']

    def get_children(self, obj):
        return MenuAllSerializer(instance=obj.menu_set.all(), many=True).data


class MenuPermissionSerializer(serializers.ModelSerializer):
    children = serializers.SerializerMethodField()

    class Meta:
        model = Menu
        fields = ['id','title', 'name', 'path', 'p_menu', 'component', 'type', 'type_name', 'children']

    def get_children(self, obj):
        menu_ids = self.context.get('menu_ids')
        if menu_ids:
            return MenuPermissionSerializer(instance=obj.menu_set.filter(type=1, id__in=menu_ids), many=True).data
        return MenuPermissionSerializer(instance=obj.menu_set.filter(type=1), many=True).data
