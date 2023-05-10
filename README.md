<h1 align="center">holbertonschool-validation</h1>

## Prerequisites:
A Valid Go-Hugo website is provided
There are no Git Submodules
The theme ananke is installed
No directory dist/ committed
Makefile present
Add comments in the Makefile to describe what each target is expected to do.
Add a “help” target to the Makefile which prints out the list of targets and their usage


## Lifecycle:
# Build:
To generate the website from the markdown and configuration files, execute the following command:

                                                                   make build
This command will use Hugo to build the website, applying any necessary optimizations, and clean the destination directory

# Clean:
To clean up the content of the dist/ directory, run the following command:
                  
                                                                    make clean
This command will remove all files and directories inside the dist/ directory, providing a clean slate for subsequent builds


# Post:       
To create a new blog post, the make post command can be used. This command relies on the environment variables POST_TITLE and POST_NAME to determine the filename and title of the new blog post:
  
To set the values of these variables, you can use the following command:
                                                                  
                                                                   POST_TITLE ?= $(shell openssl rand -hex 16)
                              POST_NAME ?= $(shell echo $(POST_TITLE) | tr '[:upper:]' '[:lower:]' | sed 's/ /-/' | sed 's/[^a-z0-9-]*//g')
                              
After setting the environment variables, run the following command to create the new blog post:

                                                                   make post
This will create a new Markdown file in the content/posts/ directory with the specified title and name, along with the necessary front matter

# Help:
To display a list of available targets and their usage/comments, you can run the following command:

                                                                   make help
 This will provide an overview of all the available targets in the Makefile along with their descriptions.
                                                                     
