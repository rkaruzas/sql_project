From python:3

COPY . /flaskapp
WORKDIR /flaskapp
RUN pip install -r requirements.txt
ENV FLASK_APP app.py

CMD flask run -h 0.0.0.0
