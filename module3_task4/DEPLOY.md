# DEPLOY

## Introduction
This document outlines the deployment process for the awesome-api application at Awesome Inc., following the Continuous Delivery approach.

## Archive Contents and Unarchiving
The `awesome-website.zip` archive contains the `awesome-api` binary and the `dist/` directory. To extract the archive, download it and extract the contents to your desired location.

## Starting and Stopping the Application
To start the application, run `./awesome-api`. To stop it, use `Ctrl+C` or terminate the corresponding process.

## Customizing Application Log Locations
You can customize the application log location by modifying the `config.yaml` file before starting the application.

## Verifying Application Health (Healthcheck)
To check if the application is running correctly, send an HTTP GET request to `http://localhost:8080/healthcheck` and ensure a 200 response with a success message.

## Continuous Delivery Workflow (module3_task2)
The `module3_task2` workflow automatically packages the awesome-api application and `dist/` directory into `awesome-website.zip` on each commit to the principal branch.

For more details, refer to the project's documentation and make sure to meet the specified requirements.

Note: The `awesome-website.zip` file is not committed and is deleted by running `make clean`.

## Release

A Github Release is created with the `tag 1.0.0` and contains the archive
`awesome-website.zip` along with the content of the file `DEPLOY.md` as text
for the release.