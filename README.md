# CDE Bootcamp
This repository contains assignments, scripts, and project work completed during the CoreDataEngineers (CDE) Data Engineering Bootcamp. The focus of this bootcamp is on building data engineering solutions using Bash scripting, PostgreSQL, and ETL (Extract, Transform, Load) pipelines.

## Table of Contents
1. Project Overview
2. Requirements
3. ETL Pipeline
4. Scripts
5. Running the Scripts
6. PostgreSQL Queries
7. Architecture Diagram

# Requirements
* Bash: for scripting
* PostgreSQL: for the database
* csvkit: for handling CSV transformations
* cron: for scheduling the daily ETL job

## ETL Pipeline
The pipeline follows a typical ETL pattern:

1. Extract: Downloads raw CSV files into a designated folder.
2. Transform: Renames columns and filters out unnecessary data.
3. Load: Loads the transformed data into a PostgreSQL database.

## Scripts
* Bash Scripts: Contains the ETL pipeline and file management tasks.
* SQL Scripts: Contains queries used for data analysis and insights.

## Folder Structure:
cde_bootcamp/
├── bash_scripts/
│   ├── etl.sh
│   ├── move_files.sh
├── README.md
`