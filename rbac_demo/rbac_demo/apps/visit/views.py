from django.shortcuts import render
from utils.common_view import MyModelViewSet
from rest_framework.decorators import action
from .models import Client
from .serializer import ClientSerializer
from utils.common_response import APIResponse
from django.db.models import Count

# Create your views here.


class ClientView(MyModelViewSet):
    queryset = Client.objects.all()
    serializer_class = ClientSerializer

    @action(methods=['get'], detail=False)
    def browser_all(self, request):
        google = len(Client.objects.filter(browser=0))
        fire_fox = len(Client.objects.filter(browser=1))
        apple = len(Client.objects.filter(browser=2))
        other = len(Client.objects.filter(browser=3))
        l = [{'value': google, 'name': '谷歌浏览器'},{'value': fire_fox, 'name': '火狐浏览器'}, {'value': apple, 'name': '苹果浏览器'}, {'value': other, 'name': '其他浏览器'}]
        return APIResponse(data=l)

    @action(methods=['get'], detail=False)
    def client_all(self, request):
        phone = len(Client.objects.filter(client=0))
        pc = len(Client.objects.filter(client=1))
        return APIResponse(data={'phone': phone, 'pc': pc})

    @action(methods=['get'], detail=False)
    def test(self, request):
        google = Client.objects.values('browser').annotate(bro_count=Count('browser'))
        print(google)
        return APIResponse()