#!/bin/bash

# Define source and destination directories
SOURCE_DIR="."
DEST_DIR="json_and_CSV"

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Move all CSV and JSON files to the destination directory
mv "$SOURCE_DIR"/*.{csv,json} "$DEST_DIR" 

# Print completion message
echo "CSV and JSON files have been moved to $DEST_DIR"
