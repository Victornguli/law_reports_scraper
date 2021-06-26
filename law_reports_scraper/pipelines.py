# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


# useful for handling different item types with a single interface
import logging
import os
import psycopg2
from itemadapter import ItemAdapter


class LawReportsScraperPipeline:
    def open_spider(self, spider):
        hostname = 'postgres'
        username = os.getenv('POSTGRES_USER')
        database = os.getenv('POSTGRES_DB')
        port = os.getenv('POSTGRES_PORT')
        password = os.getenv('POSTGRES_PASSWORD')
        logging.info(username)
        logging.info(database)
        self.connection = psycopg2.connect(
            host=hostname, user=username, dbname=database, port=port, password=password)
        self.cur = self.connection.cursor()

    def close_spider(self, spider):
        self.cur.close()
        self.connection.close()

    def process_item(self, item, spider):
        volume = item['volume']
        jurisdiction = item['jurisdiction']
        reporter = item['reporter']
        court = item['court']
        case = item['case']
        judges = item['judges']
        matters = item['matters']
        issues = item['issues']
        citations = item['citations']

        insert_volume = "INSERT INTO volumes (name,barcode) VALUES (%s,%s) RETURNING id;"
        self.cur.execute(insert_volume, (volume['name'], volume['barcode']))
        volume_id = self.cur.fetchone()[0]

        insert_jurisdiction = "INSERT INTO jurisdictions (name_long,slug,name,whitelisted) VALUES (%s,%s,%s,%s) RETURNING id;"
        self.cur.execute(
            insert_jurisdiction,
            (jurisdiction['name_long'], jurisdiction['slug'], jurisdiction['name'], jurisdiction['whitelisted'])
        )
        jurisdiction_id = self.cur.fetchone()[0]

        insert_reporter = "INSERT INTO reporters (full_name,short_name) VALUES (%s,%s) RETURNING id;"
        self.cur.execute(insert_reporter, (reporter['full_name'], reporter['short_name']))
        reporter_id = self.cur.fetchone()[0]

        insert_court = "INSERT INTO courts (name,name_abbreviation) VALUES (%s,%s) RETURNING id;"
        self.cur.execute(insert_court, (court['name'], court['name_abbreviation']))
        court_id = self.cur.fetchone()[0]

        insert_case = (
            "INSERT INTO cases(name,decision_date,first_page,last_page,status,volume_id,reportor_id,court_id,"
            "jurisdiction_id) values(%s,%s,%s,%s,%s,%s,%s,%s,%s) RETURNING id"
        )
        self.cur.execute(
            insert_case,
            (
                case['name'],
                case['decision_date'],
                case['first_page'],
                case['last_page'],
                case['status'],
                volume_id,
                reporter_id,
                court_id,
                jurisdiction_id
            )
        )
        case_id = self.cur.fetchone()[0]

        for judge in judges:
            insert_judge = "INSERT INTO judges (name) VALUES (%s) RETURNING id;"
            self.cur.execute(insert_judge, (judge,))
            judge_id = self.cur.fetchone()[0]

            insert_case_judge = 'INSERT INTO cases_judges(case_id, judge_id) VALUES(%s,%s);'
            self.cur.execute(insert_case_judge, (case_id, judge_id))

        for matter in matters:
            insert_matter = "INSERT INTO matters (name, description) VALUES (%s, %s) RETURNING id;"
            self.cur.execute(insert_matter, (matter['name'], matter['description']))
            matter_id = self.cur.fetchone()[0]

            insert_case_matters = 'INSERT INTO cases_matters(case_id, matter_id) VALUES(%s,%s);'
            self.cur.execute(insert_case_matters, (case_id, matter_id))

        for issue in issues:
            insert_issue = "INSERT INTO issues (text) VALUES (%s) RETURNING id;"
            self.cur.execute(insert_issue, (issue,))
            issue_id = self.cur.fetchone()[0]

            insert_case_issues = 'INSERT INTO cases_issues(case_id, issue_id) VALUES(%s,%s);'
            self.cur.execute(insert_case_issues, (case_id, issue_id))

        citations = ''.join(citations)
        insert_citation = "INSERT INTO citations (cite, case_id) VALUES (%s,%s) RETURNING id;"
        self.cur.execute(insert_citation, (citations, case_id))
        citation_id = self.cur.fetchone()[0]

        self.connection.commit()
        return item
