
# PNG Image Processing Scripts for Linux/Unix Systems

## Description

This repository contains several Bash scripts for processing PNG images.

🚀 Features:
- Removes the excess transparent area of PNG images and crops them to their content.
- Resize PNG images while preserving transparency.
- Optimize PNG images using pngquant.

## Scripts

### 1. crop_to_content_png.sh

Removes the excess transparent area of PNG images and crops them to their content. Ensure your images are stored in a folder named `img` in the script's directory.

**Usage:**
```bash
./crop_to_content_png.sh
```

### 2. resize_png.sh

Resize PNG images while preserving transparency. Ensure your images are stored in a folder named `img` in the script's directory.

**Usage:**
```bash
./resize_png.sh
```

### 3. optimize_png.sh

Optimize PNG images using pngquant. Ensure your images are stored in a folder named `img` in the script's directory.

**Usage:**
```bash
./optimize_png.sh
```

### 4. process_png.sh

Execute the following scripts in sequence:

1. `crop_to_content_png.sh`
2. `resize_png.sh`
3. `optimize_png.sh`

## Dependencies

### 1. ImageMagick

Installation on Ubuntu:

```bash
sudo apt install imagemagick
```
Installation on Fedora:

```bash
sudo dnf install imagemagick
```

### 2. pngquant

Installation on Ubuntu:

```bash
sudo apt install pngquant
```
Installation on Fedora:

```bash
sudo dnf install pngquant
```

### 3. bc

Installation on Ubuntu:

```bash
sudo apt install bc
```
Installation on Fedora:

```bash
sudo dnf install bc
```

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).