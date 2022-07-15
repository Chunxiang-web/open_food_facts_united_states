# Open Food Facts - United States
An exploration into US data from Open Food Facts public database using Google Cloud, specifically BigQuery and Google Data Studio.

## Tech/Frameworks Used
Includes Google Cloud Storage, Google BigQuery, CLI, SQL, Data Studio

## Inspiration
The proverbial saying 'You are what you eat' is the notion that to be fit and healthy you need to eat good food. But in reality, people don't have information about what are the unhealthy foods we should try to avoid in our daily life. This data analysis provides insights of the food facts in regards to carbohydrates, as well as breakdowns by generic names, brands and stores.

## How I built it
downloaded an open dataset from Kaggle, uploaded it to Google Cloud Storage, loaded the raw dataset into BigQuery, created new aggregated data tables and a dashboard showcasing the results. 

## Challenges I ran into
### Loading data to BigQuery
Given the size (1 GB), loading the data into BigQuery proved more difficult than I thought. To actually load this data table I tried to "Create from upload" via the BigQuery UI but the first hit limitations as files of 100MB or less are unable to be uploaded.

Next I tried to "Create from Cloud Storage" but there were issues with column names copying over correctly.

Finally I resorted to using the CLI with the command. The first attempt failed due to bad records, but was able to finally resolve the issue by using the --max_bad_records record.

The command that eventually worked was
bq load --autodetect --max_bad_records=5000 --source_format=TSV food_data_kaggle.food_data_kaggle gs://food_data_b/en.openfoodfacts.org.products.tsv

### Data Studio Charts
It took a little while to understand how to add data sources, and eventually settled on using 4 created tables in BigQuery vs. custom queries due to speed purposes.

## Accomplishments that I am proud of
I now have familiarity with Google Cloud and various tools within the platform.

