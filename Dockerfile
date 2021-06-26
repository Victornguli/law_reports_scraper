FROM python:3.9.5-slim-buster
WORKDIR /usr/src/law-scraper

RUN apt update && apt-get -y install libpq-dev gcc

RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/law-scraper/requirements.txt
RUN pip install -r requirements.txt

COPY . /usr/src/law-scraper

CMD ["scrapy", "crawl", "nwlonline"]