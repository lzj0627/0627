# Generated by Django 3.2.2 on 2023-03-23 16:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('permission', '0008_auto_20230323_0944'),
    ]

    operations = [
        migrations.AddField(
            model_name='menu',
            name='title',
            field=models.CharField(max_length=32, null=True, verbose_name='标题'),
        ),
    ]
