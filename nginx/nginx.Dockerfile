FROM nginx:latest

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y python3 \
                       python3-pip \
                       python3-dev \
                       build-essential \
                       libmariadb-dev-compat \
                       libmariadb-dev \
                       nano

# installing python packages
RUN pip3 install --upgrade setuptools
RUN pip3 install django djangorestframework mysqlclient uwsgi

COPY ./conf/django_conf.ini /etc/nginx/
#COPY ./conf/nginx.conf /etc/nginx/

WORKDIR /usr/share/nginx/rest/
#CMD ["uswgi django_conf.ini"]