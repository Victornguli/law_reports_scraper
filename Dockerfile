FROM python:3.8-slim-buster
WORKDIR /usr/src/law-scraper

RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/law-scraper/requirements.txt
RUN pip install -r requirements.txt

COPY . /usr/src/law-scraper/