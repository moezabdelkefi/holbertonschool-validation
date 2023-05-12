#!/bin/bash

# Check if Hugo is already installed
if ! command -v hugo &> /dev/null; then
    # Install Hugo
    sudo apt-get update
    sudo apt-get install -y hugo
fi

# Check if Make is already installed
if ! command -v make &> /dev/null; then
    # Install Make
    sudo apt-get update
    sudo apt-get install -y make
fi

# Rest of your setup script...
