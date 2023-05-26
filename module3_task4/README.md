# DevOps Automation Project

This project aims at demonstrating the value of a DevOps mindset in a software project by focusing on automation, decreasing manual work, and increasing development speed.

## Learning Objectives

By the end of this project, you should be able to:

- Understand the value of automating tedious tasks
- Define a development lifecycle
- Automate shell-like tasks with Make, and/or shell script
- Be aware of tools dependencies and the value of reproducing environments
- Build static HTML websites from Markdown code using Go-Hugo

## Prerequisites

### Concepts

You should have a basic knowledge of the following concepts:

- Shell terminal basics, using command lines
- Git with the command line (and also a graphical interface)
- Make/Makefile usage

### Tooling

This project needs the following tools / services:

- An HTML5-compliant web browser
- A free account on GitHub, referenced as `<GitHub Handle>`
- A shell terminal with bash, zsh, or ksh, including the standard Unix toolset
- GNU Make v3.81+
- Git (command line) v2+
- Go Hugo v0.84+ (crucial for the theme you'll use)
- Ability to spawn a clean Ubuntu 18.04 system (Docker is recommended)
- A text editor or IDE of your convenience

## Project Scenario

You are a software engineer at "Awesome Inc." working on their web services. Your goal is to help the company grow a culture of collaboration with a technical mindset while managing their existing web services, in line with the DevOps philosophy.

## Reference Readings / Watching

- [Go Hugo Quickstart](https://gohugo.io/getting-started/quick-start/)
- [Git SCM Book](https://git-scm.com/book/en/v2)
- [GNU Make Docs](https://www.gnu.org/software/make/manual/make.html)
- [Installing & Using Themes](https://gohugo.io/themes/installing-and-using-themes/)
- [Add a help target to a Makefile](https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html)


## Lifecycle of a Hugo Website with Makefile

This guide demonstrates the lifecycle of a Hugo website using a Makefile to automate common tasks.

## Requirements

1. [Hugo](https://gohugo.io/getting-started/installing/)
2. A Makefile with the following commands:
    - `build`: Build the website
    - `clean`: Clean the `dist` directory
    - `post`: Create a new Markdown post
    - `help`: Display information about the available commands

## Step 1: Create a new post

To create a new post, use the `post` command in the Makefile. Replace `POST_NAME` with the desired file name and `POST_TITLE` with the desired title:

```bash
make post POST_NAME=my-new-post POST_TITLE="My New Post"
