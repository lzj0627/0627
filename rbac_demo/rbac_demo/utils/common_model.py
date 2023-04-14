from django.db import models


class BaseModel(models.Model):
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='注册时间', null=True)
    update_time = models.DateTimeField(auto_now=True, verbose_name='更新时间', null=True)
    is_del = models.BooleanField(default=False, verbose_name='是否删除')

    class Meta:
        abstract = True
