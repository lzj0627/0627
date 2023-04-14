from rest_framework import serializers
from django.db.models import Count
from .models import Client


class ClientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Client
        fields = ['id', 'ip', 'browser', 'client']