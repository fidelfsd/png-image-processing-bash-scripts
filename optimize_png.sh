#!/bin/bash

# Optimize PNG images using pngquant. Ensure your images are stored in a folder named `img` in the script's directory.

# Text color: green for success messages
color_success='\033[0;32m'

# Reset color to default
reset_color='\033[0m'

# Directory containing PNG images to optimize
image_directory="./img"

# Processed images counter
counter=0

# Total number of images in the directory
total_images=$(find "$image_directory" -type f -name '*.png' | wc -l)

# Set the quality range for pngquant
quality_range="50-70"

# Iterate over all PNG images in the directory (short version in one line)
# find "$image_directory" -name '*.png' -exec pngquant -v --quality="$quality_range" --ext .png --force 256 {} \;

echo "----------------------------------------------------------------"
echo "Running optimization process..."
echo "----------------------------------------------------------------"

# Iterate over all PNG images in the directory
for image in "$image_directory"/*.png; do
    # Check if the file is a PNG image
    if [ -f "$image" ]; then
        # File name without extension
        file_name=$(basename "$image" .png)

        # Run pngquant to optimize the image
        pngquant --quality="$quality_range" --ext .png --force 256 "$image"

        # Increment the counter
        ((counter++))

        # Calculate the execution percentage
        percentage=$(echo "scale=2; $counter * 100 / $total_images" | bc)

        # Get only the image name
        prefix_to_remove="$image_directory/"
        image=${image#$prefix_to_remove}

        # Print the colored image name
        image="${color_success}$image${reset_color}"

        echo -e "[ $percentage% ] Optimized image: $image"
    fi
done

echo "Process completed."
