#!/bin/bash

# Read the version from module.json
version=$(jq -r '.version' module.json)

# Replace any dots in the version with underscores
version=${version//./_}

# Create the output filename with the version
output_filename="universal-miui-doze_${version}.zip"

# Exclude file.txt from the zip
exclude_file="gen-zip.sh"

# Zip the current directory, excluding the specified file
zip -r "$output_filename" . -x "$exclude_file"

echo "module output $output_filename"
