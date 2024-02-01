#!/bin/bash

# Resize PNG images while preserving transparency. Ensure your images are stored in a folder named `img` in the script's directory.

# Text color: green for success messages
color_success='\033[0;32m'

# Reset color to default
reset_color='\033[0m'

# Directory containing PNG images
image_directory="./img"

# Desired size of the images
size="400x400"

# Processed images counter
counter=0

# Total number of images in the directory
total_images=$(find "$image_directory" -type f -name '*.png' | wc -l)

echo "----------------------------------------------------------------"
echo "Running resizing process..."
echo "----------------------------------------------------------------"

# Iterate over all PNG images in the directory
for image in "$image_directory"/*.png; do
    # File name without extension
    file_name=$(basename "$image" .png)

    # Resize and crop the image while preserving transparency without overwriting the original file
    # convert "$image" -resize "$size" -background none -gravity center -extent "$size" "$image_directory/${file_name}_resized.png"

    # Resize and crop the image while preserving transparency and overwrite the original file
    convert "$image" -resize "$size" -background none -gravity center -extent "$size" "$image"

    # Increment the counter
    ((counter++))

    # Calculate the execution percentage
    percentage=$(echo "scale=2; $counter * 100 / $total_images" | bc)

    # Get only the image name
    prefix_to_remove="$image_directory/"
    image=${image#$prefix_to_remove}

    # Print the colored image name
    image="${color_success}$image${reset_color}"

    echo -e "[ $percentage% ] Resized image: $image"
done

echo "Process completed."
