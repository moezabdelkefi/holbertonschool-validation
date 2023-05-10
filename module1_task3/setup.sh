#!/bin/bash

# Install Hugo and Make
apt-get update && apt-get install -y hugo make

# Clone your project repository
git clone https://github.com/moezabdelkefi/holbertonschool-validation

# Change into the project directory
cd module1_task3

# Build the website using Make
make build