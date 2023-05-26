#!/bin/bash
sudo apt-get update && sudo apt-get install -y make git wget zip

wget https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_extended_0.84.0_Linux-64bit.deb
dpkg -i hugo_extended_0.84.0_Linux-64bit.deb
sudo rm hugo_extended_0.84.0_Linux-64bit.deb

sudo go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.52.2
sudo npm install -g markdownlint-cli
sudo npm install -g markdown-link-check