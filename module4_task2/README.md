# Module 1: Introduction to DevOps: Automate Everything

## Learning Objectives

This project aims to demonstrate the use cases where a DevOps mindset brings value to a software project by automating tasks, thereby reducing manual work and increasing development speed. It focuses on the importance of automation and its role in speeding up the development lifecycle.

After completing this project, you should be able to:

- Understand the value of automating tedious tasks
- Define a development lifecycle
- Automate shell-like tasks with Make or shell scripts
- Be aware of tool dependencies and the importance of reproducing the environment
- Build a static HTML website from Markdown code using Go-Hugo

## Prerequisites

In addition to the prerequisites from the previous module ("Module 0: Linux Fundamentals, Code Management with Git, GitHub, and the GitFlow Pattern"), the following elements are required:

Concepts:

You should have a basic knowledge of the following concepts:

- Shell terminal basics, including command lines:

  - Navigating in a Unix file system
  - Understanding stdin/stdout redirection and piping
  - Viewing and searching the content of text files
  - Defining and using environment variables
  - Adding command lines to your terminal using the apt-get package manager and/or the PATH variable
  - Writing and executing shell scripts

- Using Git with the command line (and also a graphical interface):

  - Retrieving or creating a repository
  - Manipulating changes locally with Git's three-step process (workspace, staging, history)
  - Distributing changes history with remote repositories

- Make/Makefile usage:
  - Executing tasks through make targets
  - Understanding default targets and PHONY targets
  - Understanding Makefile variables and macro syntax

Tooling:

This project requires the following tools/services:

- An HTML5-compliant web browser (Firefox, Chrome, Opera, Safari, Edge, etc.)
- A free account on [GitHub](https://github.com/), referenced as `GitHub Handle`
- A shell terminal with bash, zsh, or ksh, including the standard Unix toolset (ls, cd, etc.)
- [GNU Make](https://www.gnu.org/software/make/) version 3.81 or higher
- [Git](https://git-scm.com/book/en/v2/Getting-Started-The-Command-Line) (command line) version 2 or higher
- [Go Hugo](https://gohugo.io/) version 0.80 or higher

How to use the Makefile:

## Build Workflow

You can see that some tools required to build our application, like make or Golang, are available. However, others are missing.

There are two different strategies to solve this challenge, each with its pros and cons:

- Install the tools during the build:

  - ✅ It ensures that you have an automated and always up-to-date installation system
  - ❌ However, it slows down the builds as you have to wait for all tools to be installed while you want feedback as soon as possible

- Ensure that the workflow is running inside a pre-built environment with all the required tools:
  - ✅ Fast feedback: you don't need to wait for tool installation
  - ❌ Maintenance overhead as you need to manage the pre-built environment

For this module, we'll use the first strategy, and the second will be covered in the "Docker" module.

It should be an easy step: you have already written a script `setup.sh` whose role was to install Hugo in the production environment. Let's reuse this work!

You are expected to create a new workflow named `module 3_task1` based on the previous workflow.

This new workflow should execute the following targets as distinct steps: `lint`, `build`, `unit-tests`, `validate`, and `integration-tests`.

Regarding the tooling, you need to:

- Ensure that the workflow is executed in an `Ubuntu 18.04` execution environment.
- Ensure that all the required tools are installed prior to executing any `make` targets by running the `setup.sh` script.
- ⚠️ The script should be modified to only install missing tools (no `make` targets are expected).
- ✨ As you are expected to understand the value of linters, tests, and documentation, you are also expected to lint the `setup.sh` script during the `make lint` target using `Shellcheck`.

## Workflow

You are expected to create a new [workflow](https://docs.github.com/en/actions) named `module3_task0` with only the following steps:

- Clone the repository.
- Navigate to the correct directory and execute the command `make help` to validate that the Makefile is present and implements the `help` target.

This workflow must be [triggered](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows) under the following conditions:

- Whenever new code is pushed to your repository.
- Once per day (at any desired time).

## Lifecycle

To execute the Makefile, use the following syntax: `make <command>`

- `build`: Builds a new version of the website to the `/dist/` folder.
- `clean`: Removes the contents of the `/dist/` folder.
- `post`: Creates a new post in the `contents/post` folder with `POST_TITLE` and `POST_NAME` set from the environment variables.
- `help`: Prints out information about the commands to the terminal.

## Story

Congratulations!

It's your first day at "Awesome Inc." as a software engineer. This company is currently experiencing rapid growth and has hired you to work on their web services.

Your predecessor left to travel the world, and there are high expectations for your ability to help "Awesome Inc." grow a culture of collaboration with a technical mindset while managing their existing web services. That's exactly what DevOps is about!

# Workflow

- install tools
- lint
- help
- build
- build-docker
- docker-tests

# Build

- package
- release
- archive build
- upload-package
- deploy
