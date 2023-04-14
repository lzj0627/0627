#依赖镜像名称和ID
FROM python:3.8
#指定镜像创建者信息
MAINTAINER lzj
#切换工作目录
RUN mkdir /soft
WORKDIR /soft
COPY ./requirements.txt /soft/requirements.txt
RUN pip install -r requestments.txt -i https://pypi.doubanio.com/simple
CMD ["uwsgi", "./rbac_demo.ini"]