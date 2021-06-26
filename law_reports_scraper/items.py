# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class LawReportsScraperItem(scrapy.Item):
    volume = scrapy.Field()
    reporter = scrapy.Field()
    court = scrapy.Field()
    jurisdiction = scrapy.Field()
    case = scrapy.Field()
    judges = scrapy.Field()
    matters = scrapy.Field()
    issues = scrapy.Field()
    citations = scrapy.Field()


class CasesItem(scrapy.Item):
    pass
