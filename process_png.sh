#!/bin/bash

# Call the cropping script
./crop_to_content_png.sh

# Call the resizing script
./resize_png.sh

# Call the optimization script
./optimize_png.sh

echo "----------------------------------------------------------------"
echo "All process completed."
echo "----------------------------------------------------------------"
