#!/bin/bash

# This script attempts to process a file, but it has a subtle error that can lead to unexpected behavior.

file_to_process="my_file.txt"

# Check if the file exists and is readable
if [ -r "$file_to_process" ]; then
  # Process the file (example: print its contents)
  cat "$file_to_process"
else
  echo "Error: File '$file_to_process' does not exist or is not readable."
fi

#This is where the bug is. The exit code is not checked.
process_file() {
  local file=$1
  if [ ! -f "$file" ]; then
    echo "Error: File '$file' not found"
    return 1 # Indicate an error
  fi
  #Simulate some file processing
  sleep 1
  echo "Processing file: $file"
}

process_file "$file_to_process"

#The script continues executing even if there is an error
echo "Script execution completed"
