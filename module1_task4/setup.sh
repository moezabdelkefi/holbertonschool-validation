#!/bin/bash

# Check if Hugo is already installed
if ! command -v hugo &> /dev/null; then
    # Install Hugo
    sudo apt-get update
    sudo apt-get install -y hugo
fi

# Create the dist directory if it doesn't exist
if [ ! -d "./dist" ]; then
    mkdir ./dist
fi

# Generate the website using Hugo
hugo -d ./dist

# Check if Make is already installed
if ! command -v make &> /dev/null; then
    # Install Make
    sudo apt-get update
    sudo apt-get install -y make
fi

# Rest of your setup script...
