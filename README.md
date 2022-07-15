# Open Food Facts - United States
An exploration into US data from Open Food Facts public database using Google Cloud, specifically BigQuery and Google Data Studio.

## Tech/Frameworks Used
Includes Google Cloud Storage, Google BigQuery, CLI, SQL, Data Studio

## Screenshots
### BigQuery Table Example
![alt text](https://github.com/Chunxiang-web/open_food_facts_united_states/blob/main/screenshots/bigquery_table_example.png)

### Data Studio Dashboard
![alt text](https://github.com/Chunxiang-web/open_food_facts_united_states/blob/main/screenshots/data_studio_dashboard.png)

## Inspiration
The proverbial saying 'You are what you eat' is the notion that to be fit and healthy you need to eat good food. But in reality, people don't have information about what are the unhealthy foods we should try to avoid in our daily life. This data analysis provides insights of the food facts in regards to carbohydrates, as well as breakdowns by generic names, brands and stores.

## How I built it
I downloaded an open dataset from Kaggle, uploaded it to Google Cloud Storage, loaded the raw dataset into BigQuery, created new aggregated data tables and a dashboard showcasing the results. 

## Challenges I ran into
### Loading data to BigQuery
Given the size (1 GB), loading the data into BigQuery proved more difficult than I thought. To actually load this data table I tried to "Create from upload" via the BigQuery UI but the first hit limitations as files of 100MB or less are unable to be uploaded.

Next I tried to "Create from Cloud Storage" but there were issues with column names copying over correctly.

Finally I resorted to using the CLI. The first attempt failed due to bad records, but was able to finally resolve the issue by using the --max_bad_records record.

### Data Studio Charts
It took a little while to understand how to add data sources, and eventually settled on using 4 created tables in BigQuery vs. custom queries due to speed purposes.

## Installation / How to use?
To run this on your own Google Cloud project
- Create Google Cloud project (there's $300 in free credits and you won't be charged for overage unless you explicitly opt in to a paid account)
- Download Open Food Facts dataset from Kaggle https://www.kaggle.com/datasets/openfoodfacts/world-food-facts
- Create bucket and load to Cloud Storage
- Load file to BigQuery using the following CLI command: bq load --autodetect --max_bad_records=5000 --source_format=TSV food_data_kaggle.food_data_kaggle gs://food_data_b/en.openfoodfacts.org.products.tsv
- Create a dataset in BigQuery, then create 4 aggregated tables using the SQL files included
- Go to Data Studio webpage and create a new dashboard, using the 4 tables as data sources

