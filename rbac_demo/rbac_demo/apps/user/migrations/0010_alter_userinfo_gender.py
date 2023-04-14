# Generated by Django 3.2.2 on 2023-03-27 10:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0009_alter_userinfo_status'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userinfo',
            name='gender',
            field=models.CharField(choices=[('1', '男'), ('2', '女'), ('3', '保密')], default='3', max_length=2, verbose_name='性别'),
        ),
    ]
