from django.db import models
from utils.common_model import BaseModel
from permission.models import Dept, Roles, Job
from django.contrib.auth.models import AbstractUser
from django.contrib.auth.hashers import make_password, check_password


# Create your models here.


class UserInfo(AbstractUser):
    gender_choices = (
        ('1', '男'),
        ('2', '女'),
        ('3', '保密')
    )
    mobile = models.CharField(max_length=11, unique=True, verbose_name='手机号', null=True)
    avatar = models.FileField(upload_to='avatar', default='avatar/default.png', verbose_name='头像')
    gender = models.CharField(choices=gender_choices, default='3', max_length=2, verbose_name='性别')
    status = models.BooleanField(verbose_name='是否正常', default=True)
    pwd_reset_time = models.DateTimeField(auto_now_add=True, verbose_name='修改密码的时间')
    is_login = models.BooleanField(default=False, verbose_name='是否登录')
    is_del = models.BooleanField(default=False, verbose_name='是否被删除')

    # 关联字段
    dept = models.ForeignKey(to='permission.Dept', on_delete=models.SET_NULL, verbose_name='部门', null=True, blank=True)
    roles = models.ManyToManyField(to='permission.Roles', db_table='user_rules', verbose_name='用户和角色关联表', null=True)
    job = models.ManyToManyField(to='permission.Job', db_table='user_job', verbose_name='用户和岗位关联表',null=True)

    class Meta:
        db_table = 'rbac_user'
        verbose_name = '用户表'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username

    def gender_name(self):
        return self.get_gender_display()

    def value(self):
        return self.username

    @staticmethod
    def make_password(password, salt=None, hasher='default'):
        return make_password(password, salt, hasher)
