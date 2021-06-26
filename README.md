## Law Reports Scraper
A dockerized scrapy/postgres environment for scraping law reports.

### Getting started
Clone this repo and run: docker-compose up.

To run the scraper run 
```docker exec -it law-scraper scrapy crawl nwlonline```
which will run scrapy inside the target container and save the scrape data in
the PostgreSQl instance.

To access PostgreSQL and run custom commands run:  
```docker exec -it law_reports_scraper_postgres_1 psql -d public -U supabase_admin```


feel free to ask any further-up questions regarding this scrapy pipeline. My email is victonjoseph@gmail.com!11