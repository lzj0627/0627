from rest_framework.viewsets import ModelViewSet,GenericViewSet
from .common_response import APIResponse


class MyModelViewSet(ModelViewSet):
    def list(self, request, *args, **kwargs):
        res = super().list(request, *args, **kwargs)
        return APIResponse(data=res.data)

    def retrieve(self, request, *args, **kwargs):
        res = super().retrieve(request, *args, **kwargs)
        return APIResponse(data=res.data)

    def create(self, request, *args, **kwargs):
        res = super().create(request, *args, **kwargs)
        return APIResponse(data=res.data)

    def update(self, request, *args, **kwargs):
        res = super().update(request, *args, **kwargs)
        return APIResponse(data=res.data)
