 
#!/bin/bash

# Directory containing the files
DIRECTORY="./img"

# Change directory
cd "$DIRECTORY"


echo "----------------------------------------------------------------"
echo "Running rename file process..."
echo "----------------------------------------------------------------"
# Iterate over all files in the current directory
for file in *; do
    # Check if the file is a regular file
    if [ -f "$file" ]; then
        # Get the filename without the path
        filename=$(basename "$file")
        # Convert the filename to lowercase and replace spaces with underscores
        new_filename=$(echo "$filename" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')
        # Check if the new filename is different from the current filename
        if [ "$filename" != "$new_filename" ]; then
            # Rename the file
            mv "$filename" "$new_filename"
            echo "File renamed: $filename -> $new_filename"
        fi
    fi
done

echo "Process completed."
