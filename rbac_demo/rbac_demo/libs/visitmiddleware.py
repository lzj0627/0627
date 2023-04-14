from django.utils.deprecation import MiddlewareMixin
from visit.models import Client


class VisitMiddleware(MiddlewareMixin):

    def process_response(self, request, response):
        client = request.META.get("HTTP_USER_AGENT")
        if request.path == '/api/v1/visit/visit/browser_all/':
            ip = request.META.get('REMOTE_ADDR')
            if 'Windows' or 'Mac' or 'Linux' in client:
                client_type = 1
            client_type = 0
            if 'Firefox' in client:
                Client.objects.create(ip=ip, browser=1, client=client_type, user=request.user)
            elif 'Chrome' in client:
                Client.objects.create(ip=ip, browser=0, client=client_type, user=request.user)
            elif 'Safari' in client and 'Apple' in client:
                Client.objects.create(ip=ip, browser=2, client=client_type, user=request.user)
            else:
                Client.objects.create(ip=ip, browser=3, client=client_type, user=request.user)
        return response
