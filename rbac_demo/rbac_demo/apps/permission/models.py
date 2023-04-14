from django.db import models
from utils.common_model import BaseModel


# Create your models here.


class Menu(BaseModel):
    menu_choice = (
        (0, '目录'),
        (1, '菜单'),
        (2, '按钮'),
    )
    name = models.CharField(max_length=32, verbose_name='菜单名')
    title = models.CharField(max_length=32, verbose_name='标题', null=True, blank=True)
    type = models.IntegerField(choices=menu_choice, default=1, verbose_name='类型')
    p_menu = models.ForeignKey('self', null=True, blank=True, on_delete=models.SET_NULL)
    path = models.CharField(max_length=32, verbose_name='路由地址', null=True, blank=True)
    status = models.BooleanField(default=True)
    component = models.CharField(max_length=32, verbose_name='前端组件名', unique=True, null=True, blank=True)
    hidden = models.BooleanField(default=False, verbose_name='是否隐藏')
    permission = models.CharField(max_length=32, null=True, blank=True)

    class Meta:
        db_table = 'menu'
        verbose_name = '菜单权限表'
        verbose_name_plural = verbose_name

    def type_name(self):
        return self.get_type_display()

    def __str__(self):
        return self.name


class Dept(BaseModel):
    name = models.CharField(max_length=32, verbose_name='部门名')
    status = models.BooleanField(default=True, verbose_name='部门状态')
    p_dept = models.ForeignKey('self', null=True, on_delete=models.SET_NULL, verbose_name='是否有父部门', blank=True)
    dept_count = models.IntegerField(null=True, verbose_name='子部门数量', blank=True)

    class Meta:
        db_table = 'dept'
        verbose_name = '部门表'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def user_count(self):
        return self.userinfo_set.count()

    def job_list(self):
        return [{'id': i.id, 'name': i.name, 'status': i.status} for i in self.job_set.filter(status=True)]

    def p_dept_name(self):
        if self.p_dept:
            return self.p_dept.name
        return '无父部门'


class Roles(BaseModel):
    name = models.CharField(max_length=32, verbose_name='角色名')
    msg = models.CharField(max_length=64, verbose_name='角色介绍', null=True, blank=True)
    status = models.BooleanField(default=True, verbose_name='角色状态')
    depts = models.ManyToManyField(to=Dept, db_table='role_dept', verbose_name='角色和部门关联表')
    menus = models.ManyToManyField(to=Menu, db_table='role_menu', verbose_name='菜单和角色关联表')

    class Meta:
        db_table = 'roles'
        verbose_name = '角色表'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Job(BaseModel):
    name = models.CharField(max_length=32, verbose_name='岗位名')
    status = models.BooleanField(default=True, verbose_name='岗位状态')
    dept = models.ForeignKey(to=Dept, on_delete=models.SET_NULL, null=True)

    class Meta:
        db_table = 'job'
        verbose_name = '岗位表'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def dept_name(self):
        return self.dept.name

    def value(self):
        return self.name
