FROM: python:alpine
RUN pip install --upgrade pip
WORKDIR /app
RUN python -m venv env
RUN source env/bin/activate
RUN pip install flask uwsgi redis
RUN pip list

