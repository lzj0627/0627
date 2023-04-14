from django.db import models
from user.models import UserInfo

# Create your models here.


class Client(models.Model):
    browser_list = [
        (0, '谷歌浏览器'),
        (1, '火狐浏览器'),
        (2, '苹果浏览器'),
        (3, '其他浏览器'),
    ]
    client_list = [
        (0, '手机端'),
        (1, 'PC端'),
    ]
    ip = models.CharField(max_length=32, verbose_name='客户端ip')
    browser = models.IntegerField(choices=browser_list, verbose_name='浏览器来源')
    client = models.IntegerField(choices=client_list, verbose_name='客户端类型')

    user = models.ForeignKey(to=UserInfo, on_delete=models.SET_NULL, verbose_name='用户和客户端', null=True)

    class Meta:
        db_table = 'client'
        verbose_name = '用户来源表'
        verbose_name_plural = verbose_name


