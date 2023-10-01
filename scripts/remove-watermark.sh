#!/usr/bin/env bash

# Define a function to remove watermarks
remove_watermark() {
  input_file="$1"
  watermark="$2"

  # Uncompress the input PDF
  pdftk "$input_file" output uncompressed.pdf uncompress 

  # Rename the input file with a .bak extension
  mv "$input_file" "$input_file.bak"

  # Remove the watermark by replacing it with spaces
  sed -e "s/$watermark/ /" uncompressed.pdf > unwatermarked.pdf

  # Compress the unwatermarked PDF and save it with the original filename
  pdftk unwatermarked.pdf output "$input_file" compress
}

# Call the function with the input file and watermark text
remove_watermark "$1" "$2"

