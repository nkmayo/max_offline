#!/bin/bash

# Create the dependencies directory if it doesn't exist
mkdir -p dependencies

# Use grep to filter lines containing "conda:" and iterate through each line
grep "      - conda:" pixi.lock | while IFS= read -r line; do
  # Extract the URL after the "conda: " part using awk
  url=$(echo "$line" | awk '{print $3}')
  # Use wget to download the file into the 'dependencies' folder
  wget -P dependencies "$url"
#   echo "$url"
done