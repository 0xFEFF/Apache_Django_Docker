FROM python:3.7

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y python3-dev \
                       build-essential \
                       libmariadb-dev-compat \
                       libmariadb-dev


WORKDIR /usr/src/app 
COPY requirements.txt ./

# installing python packages
RUN pip install --upgrade setuptools
RUN pip install -r requirements.txt

#CMD [ "uwsgi", "--socket", "0.0.0.0:3031", \
#               "--uid", "uwsgi", \
#               "--plugins", "python3", \
#               "--protocol", "uwsgi", ]