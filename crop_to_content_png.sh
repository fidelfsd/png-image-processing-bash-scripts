#!/bin/bash

# Removes the excess transparent area of PNG images and crops them to their content. Ensure your images are stored in a folder named `img` in the script's directory.

# Text color: green
color_success='\033[0;32m'

# Reset color to default
reset_color='\033[0m'

# Directory containing PNG images to trim
image_directory="./img"

# Processed images counter
counter=0

# Total number of images in the directory
total_images=$(find "$image_directory" -type f -name '*.png' | wc -l)

echo "----------------------------------------------------------------"
echo "Running crop to content process..."
echo "----------------------------------------------------------------"

# Iterate over all PNG images in the directory
for image in "$image_directory"/*.png; do
    # Check if the file is a PNG image
    if [ -f "$image" ]; then
        # File name without extension
        file_name=$(basename "$image" .png)

        # Crop the image by removing the transparent area without overwriting the original file
        # convert "$image" -trim "$image_directory/${file_name}_trimmed.png"

        # Crop the image by removing the transparent area and overwrite the original file
        convert "$image" -trim "$image"

        # Increment the counter
        ((counter++))

        # Calculate the execution percentage
        percentage=$(echo "scale=2; $counter * 100 / $total_images" | bc)

        # Get only the image name
        prefix_to_remove="$image_directory/"
        image=${image#$prefix_to_remove}

        # Print the colored image name
        image="${color_success}$image${reset_color}"

        echo -e "[ $percentage% ] Cropped image: $image"
    fi
done

echo "Process completed."
