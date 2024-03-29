# Generated by Django 3.2.2 on 2023-03-23 09:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('permission', '0007_job_dept'),
    ]

    operations = [
        migrations.AlterField(
            model_name='menu',
            name='component',
            field=models.CharField(max_length=32, null=True, unique=True, verbose_name='前端组件名'),
        ),
        migrations.AlterField(
            model_name='menu',
            name='path',
            field=models.CharField(max_length=32, null=True, verbose_name='路由地址'),
        ),
    ]
