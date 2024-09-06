#!/bin/bash

# Variables
DB_NAME="posey"       # Database name
USER="postgres"       # PostgreSQL user
HOST="localhost"      # PostgreSQL host
PORT="5432"           # PostgreSQL port
PASSWORD="admin"      # PostgreSQL password
CSV_DIR="csv_files"   # Directory where CSV files are stored

# Create the database if it does not exist
PGPASSWORD=$PASSWORD psql -U $USER -h $HOST -p $PORT -tc "SELECT 1 FROM pg_database WHERE datname = '$DB_NAME'" | grep -q 1 || PGPASSWORD=$PASSWORD psql -U $USER -h $HOST -p $PORT -c "CREATE DATABASE $DB_NAME;"

# Iterate over all CSV files in the directory
for csv_file in "$CSV_DIR"/*.csv; do
    # Extract the filename without the extension to use as the table name
    table_name=$(basename "$csv_file" .csv)

    # Extract CSV header (column names)
    headers=$(head -1 "$csv_file")
    
    # Convert the CSV headers into valid SQL column definitions (assuming all columns as TEXT for simplicity)
    columns=$(echo "$headers" | sed 's/,/ TEXT,/g')
    columns="$columns TEXT"

    # Create table if it doesn't exist
    echo "Creating table $table_name..."
    PGPASSWORD=$PASSWORD psql -U $USER -h $HOST -d $DB_NAME -c "
    CREATE TABLE IF NOT EXISTS \"$table_name\" (
        $columns
    );"

    # Import CSV file into PostgreSQL table
    echo "Importing $csv_file into table $table_name..."

    # Get absolute path of the CSV file
    csv_file_abs=$(realpath "$csv_file")

    # Copy data into the PostgreSQL table
    PGPASSWORD=$PASSWORD psql -U $USER -h $HOST -d $DB_NAME -c "
    COPY \"$table_name\" FROM '$csv_file_abs'
    DELIMITER ',' CSV HEADER;"
    
    # Check if the data was copied
    PGPASSWORD=$PASSWORD psql -U $USER -h $HOST -d $DB_NAME -c "SELECT COUNT(*) FROM \"$table_name\";"
done

echo "All CSV files have been imported into the $DB_NAME database."
