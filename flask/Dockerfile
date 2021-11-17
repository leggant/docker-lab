FROM python:alpine
RUN pip install --upgrade pip
WORKDIR /app
ADD . /app
RUN python -m venv env
RUN source env/bin/activate
RUN pip install flask gunicorn redis
RUN pip list
RUN pip freeze > requirements.txt
CMD ["gunicorn", "app.ini"]
