from rest_framework.views import exception_handler as drf_exception_handler
from .common_response import APIResponse
from .common_logger import loger


def exception_handler(exc, context):
    request, view = context.get('request'), context.get('view')
    user = request.user.pk
    loger.error(
        f'用户编号【{user}】 使用请求方式【{request.method}】 向路由地址【{request.get_full_path()}】发送请求 在视图函数【{view.__class__.__name__}】 发生了错误【{str(exc)}】')
    res = drf_exception_handler(exc, context)
    if res:
        return APIResponse(code=888, msg=res.data.get('detail', '未知错误'))
    return APIResponse(code=999, msg=str(exc))
