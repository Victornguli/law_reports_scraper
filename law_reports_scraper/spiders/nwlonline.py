import logging
import os
from datetime import datetime

import scrapy
from scrapy.http import FormRequest
from dateutil import parser
from law_reports_scraper.items import CasesItem, LawReportsScraperItem


class NwlonlineSpider(scrapy.Spider):
    name = 'nwlonline'
    allowed_domains = ['nwlonline.com']
    headers = {
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
        'Host': 'nwlronline.com',
        'Upgrade-Insecure-Requests': '1',
        'Connection': 'keep-alive',
        'Pragma': 'no-cache',
        'Cache-Control': 'no-cache',
        'Accept-Language': 'en-US,en;q=0.5',
        'Accept-Encoding': 'gzip, deflate, br'
    }
    report_url = (
        'https://nwlronline.com/readpage?q=resultHeader&id=MTUxNl8xXzEyNg==&signature=$2y$10$WPg/QwsCYJ3nhQARPGCGa.'
        'lyk/gTwQcK3SS9fOddriv7Dp2D9kkje&exp_id=$2y$10$uHPh17hi6oFCr3Qa7DRUwei4QTTAUaXTJTspUL..Yuk3jVeQI3YKC'
    )  # hardcoded report url for now..
    report_iframe_url = (
        'https://nwlronline.com/api/v1/gethtml?id=MTUxNl8xXzEyNg==&sec=&signature=$2y$10$WPg/QwsCYJ3nhQARPGCGa'
        '.lyk/gTwQcK3SS9fOddriv7Dp2D9kkje&exp_id=$2y$10$uHPh17hi6oFCr3Qa7DRUwei4QTTAUaXTJTspUL..Yuk3jVeQI3YKC'
    )  # Called by javascript when report url is loaded..

    def start_requests(self):
        yield scrapy.Request(
            url='https://nwlronline.com/',
            callback=self.login,
            headers=self.headers
        )

    def login(self, response):
        try:
            token = response.css("input[name='_token']::attr(value)").get()
            username = os.getenv('username')
            password = os.getenv('password')
            yield FormRequest(
                url='https://nwlronline.com/auth/login',
                formdata={
                    "_token": token,
                    "email": username,
                    "password": password
                },
                callback=self.confirm_login,
                dont_filter=True  # handle the subsequent redirects
            )
        except Exception as e:
            logging.info(e)

    def confirm_login(self, response):
        try:
            if 'My Subscription' in response.text:
                yield scrapy.Request(url=self.report_iframe_url, dont_filter=True, callback=self.parse_law_report)
        except Exception as e:
            logging.info(e)

    def parse_law_report(self, response, **kwargs):
        try:
            with open('file.html', 'w') as f:
                f.write(response.text)
            d = {'name': response.css('#titleCaseBar').get()}
            name = """
                00.1 -> cases.name | cases.name_abbreviation | citations.cite | 
                00.2 -> cases.first_page | 00.1 -> citations.type = ‘nominative’ 
                reference to cases via case_id
            """
            volume = {'name': 'N/A', 'barcode': 'N/A'}
            reporter = {'full_name': 'N/A', 'short_name': 'N/A'}
            court = {'name': response.css('#_id017 i::text').get(''), 'name_abbreviation': 'N/A'}
            jurisdiction = {
                'name_long': 'N/A',
                'slug': 'N/A',
                'name': 'N/A',
                'whitelisted': False
            }
            decision_date = None
            try:
                decision_date = datetime.strftime(
                    parser.parse(response.css('#_id055::text').get()),
                    '%Y-%m'
                )
            except Exception as e:
                logging.info(e)
                pass

            case = {
                'first_page': int(response.css('#_idContainer001 #_id000::text').get(0)),
                'name': " ".join([
                    response.css('#_idContainer013 #_id125::text').get(),
                    response.css('#_idContainer013 #_id126::text').get(),
                    response.css('#_idContainer013 #_id127::text').get()]),
                'decision_date': decision_date,
                'status': response.css('#_id10237 i::text').get(),
                'last_page': int(response.css('#_id10062::text').get(0))
            }

            judges = [
                ''.join(x.strip() for x in response.css('#_id029 ::text').getall()),
                ''.join(x.strip() for x in response.css('#_id035 ::text').getall()),
                ''.join(x.strip() for x in response.css('#_id038 ::text').getall()),
                ''.join(x.strip() for x in response.css('#_id047 ::text').getall()),
                ''.join(x.strip() for x in response.css('#_id051 ::text').getall())
            ]

            matters = []
            matters_filters = [
                'APPEAL - ', 'PRACTICE AND PROCEDURE - ', 'JURISDICTION - ', 'COURT - ', 'CONSTITUTIONAL LAW - ']

            issues = []
            summaries = []
            issues_sections = ['Issues:', 'Facts:', 'Held']
            issues_start, issues_end = 0, False
            summaries_start, summaries_end = 0, False

            citations = []
            citation_sections = [
                'Nigerian Cases Referred to in the Judgment:',
                'Foreign Case Referred to in the Judgment:',
                'Nigerian Statutes Referred to in the Judgment:',
                'Appeals:'
            ]
            nigerian_cases_start, nigerian_cases_end = 0, False
            foreign_cases_start, foreign_cases_end = 0, False
            nigerian_statues_start, nigerian_statues_end = 0, False

            body_params = response.css('.BodyPara')
            for param in body_params:
                param_text = ''.join(param.css(' ::text').getall())

                # Extract matters
                for fltr in matters_filters:
                    if fltr in param_text:
                        split_text = param_text.split('-')
                        matters.append({
                            'name': split_text[0],
                            'description': ''.join(split_text[1:])
                        })

                # extract issues and summaries
                if issues_start == 1 and not issues_end:
                    issues_start += 1
                if summaries_start == 1 and not summaries_end:
                    summaries_start += 1

                if issues_sections[0] in param_text:
                    issues_start = 1
                elif issues_sections[1] in param_text:
                    issues_end = True
                    summaries_start = 1
                elif issues_sections[2] in param_text:
                    summaries_end = True

                if issues_start >= 2 and not issues_end:
                    issues.append(param_text)
                if summaries_start >= 2 and not summaries_end:
                    summaries.append(param_text)

                # Extract citations
                if nigerian_cases_start == 1 and not nigerian_cases_end:
                    nigerian_cases_start += 1
                if foreign_cases_start == 1 and not foreign_cases_end:
                    foreign_cases_start += 1
                if nigerian_statues_start == 1 and not nigerian_statues_end:
                    nigerian_statues_start += 1

                if citation_sections[0] in param_text:
                    nigerian_cases_start = 1
                elif citation_sections[1] in param_text:
                    nigerian_cases_end = True
                    foreign_cases_start = 1
                elif citation_sections[2] in param_text:
                    foreign_cases_end = True
                    nigerian_statues_start = 1
                elif citation_sections[3] in param_text:
                    nigerian_statues_end = True

                if nigerian_cases_start >= 2 and not nigerian_cases_end:
                    citations.append(param_text)
                if foreign_cases_start >= 2 and not foreign_cases_end:
                    citations.append(param_text)
                if nigerian_statues_start >= 2 and not nigerian_statues_end:
                    citations.append(param_text)

            struct = {
                'volume': volume,
                'reporter': reporter,
                'court': court,
                'jurisdiction': jurisdiction,
                'case': case,
                'judges': judges,
                'matters': matters,
                'issues': issues,
                'citations': citations
            }
            logging.info(struct)
            yield LawReportsScraperItem(**struct)
            # parties['appealants': response.css('#_id001::text').get()]
        except Exception as e:
            raise e
            logging.info(e)
