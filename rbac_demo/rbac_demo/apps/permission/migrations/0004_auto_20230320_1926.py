# Generated by Django 3.2.2 on 2023-03-20 19:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0002_auto_20230320_1926'),
        ('permission', '0003_auto_20230320_1926'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Rules',
        ),
        migrations.AddField(
            model_name='roles',
            name='depts',
            field=models.ManyToManyField(db_table='role_dept', to='permission.Dept', verbose_name='角色和部门关联表'),
        ),
        migrations.AddField(
            model_name='roles',
            name='menus',
            field=models.ManyToManyField(db_table='role_menu', to='permission.Menu', verbose_name='菜单和角色关联表'),
        ),
    ]
