# Generated by Django 3.2.2 on 2023-03-23 19:15

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Client',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ip', models.CharField(max_length=32, verbose_name='客户端ip')),
                ('browser', models.IntegerField(choices=[(0, '谷歌浏览器'), (1, '火狐浏览器'), (2, '苹果浏览器'), (3, '其他浏览器')], verbose_name='浏览器来源')),
                ('client', models.IntegerField(choices=[(0, '手机端'), (1, 'PC端')], verbose_name='客户端类型')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL, verbose_name='用户和客户端')),
            ],
            options={
                'verbose_name': '用户来源表',
                'verbose_name_plural': '用户来源表',
                'db_table': 'client',
            },
        ),
    ]
