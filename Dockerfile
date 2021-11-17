FROM ubuntu:18.04
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install python3 python3-setuptools python3-pip gunicorn3
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10
COPY /app /flaskapp
WORKDIR /flaskapp
RUN pip3 install -r requirements.txt
EXPOSE 5000
CMD ["flask", "run"]
