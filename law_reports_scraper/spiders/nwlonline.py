import logging

import scrapy


class NwlonlineSpider(scrapy.Spider):
    name = 'nwlonline'
    allowed_domains = ['nwlonline.com']
    start_urls = ['http://nwlonline.com/']

    def start_requests(self):
        yield scrapy.Request(
            url=''
        )

    def login(self, response):
        try:
            token = response.css("input['_token']::attr(value)").get()
            username = ''
            password = ''
            yield scrapy.Request(
                url='loginurl',
                method='POST',
                callback=self.confirm_login
            )
        except Exception as e:
            logging.info(e)

    def parse(self, response):
        pass

    def confirm_login(self, response):
        pass
