FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apache2 \
                       libapache2-mod-wsgi-py3 \
                       python3 \
                       python3-pip \
                       nano \
                       libmariadb-dev \
                       libmariadb-dev-compat \
                       virtualenv

RUN rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade setuptools
RUN pip3 install django djangorestframework mysqlclient

COPY ./conf/django_wsgi.conf /etc/apache2/conf-available/

EXPOSE 80
CMD [ "/usr/sbin/apachectl", "-DFOREGROUND" ]
