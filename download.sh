#!/bin/bash

#downloading the CSV file

# variable to hold the csv link
url=https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv

# create a folder if it does not exhit
mkdir -p raw

#download the CSV into the folder raw

curl -o raw/ent_survey_fin_yr_prov.csv $url

#check that CSV is save in raw folder

if [[ -f raw/ent_survey_fin_yr_prov.csv ]]; then
    echo "File successfully saved in the raw folder."
else
    echo "File was not saved."
fi

# transforming the downloaded CSV file

# creating the required directory
mkdir -p transformed

#use csvsql to rename and select the required columns (ensure csvkit is install with sudo apt install csvkit)
csvsql --query "SELECT year, Value, Units, Variable_code AS variable_code FROM ent_survey_fin_yr_prov "  raw/ent_survey_fin_yr_prov.csv > transformed/2023_year_finance.csv

# Check if the transformed file was created successfully
if [[ -f transformed/2023_year_finance.csv ]]; then
    echo "File successfully saved in the transformed folder."
else
    echo "File was not saved."
fi

#load the transformed data into a new directory Gold
mkdir -p Gold

cp transformed/2023_year_finance.csv  Gold/

if [[ -f gold/2023_year_finance.csv ]]; then
    echo "File successfully saved in the transformed folder."
else
    echo "File was not saved."
fi

