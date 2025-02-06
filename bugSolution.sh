#!/bin/bash

# This script demonstrates the corrected version with proper error handling

file_to_process="my_file.txt"

# Check if the file exists and is readable
if [ -r "$file_to_process" ]; then
  # Process the file (example: print its contents)
  cat "$file_to_process"
else
  echo "Error: File '$file_to_process' does not exist or is not readable."
fi

#Corrected function to handle errors
process_file() {
  local file=$1
  if [ ! -f "$file" ]; then
    echo "Error: File '$file' not found"
    return 1 # Indicate an error
  fi
  #Simulate some file processing
  sleep 1
  echo "Processing file: $file"
  return 0 # Indicate success
}

# Check the return code of the function
if process_file "$file_to_process"; then
  echo "File processed successfully"
else
  echo "Error processing file"
fi
