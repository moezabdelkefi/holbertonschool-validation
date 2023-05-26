HUGO=hugo
RM=rm -rf
SHELLCHECK=shellcheck
YAMLLINT=yamllint
YQ=yq
MARKDOWN=markdownlint
IMAGE_TAG=$(shell git tag | tail -n 1)
ifeq ($(strip $(IMAGE_TAG)),)
IMAGE_TAG=$(shell git rev-parse --abbrev-ref HEAD)
endif

.PHONY: docker-tests go-build hugo-build build post clean lint yamllint markdownlint test unit-tests integration-tests validate package help

docker-tests: ## Test the Docker image using container-structure-test
	container-structure-test test --image awesome:${IMAGE_TAG} --config cst.yml

go-build: ## Build the API binary using go
	go build

hugo-build: ## Build the website using Hugo in the dist folder
	$(HUGO)

build: ## Build everything needed for the website
	@make go-build
	@make hugo-build

post: ## Create a new post with the title changed to the ENV value
	$(HUGO) new posts/$(POST_NAME).md
	$(YQ) eval '.title = "$(POST_TITLE)"' ./content/posts/$(POST_NAME).md

clean: ## Remove all files from the dist folder
	$(RM) dist/*

lint: ## Lint the shell file and run yamllint on success
	$(SHELLCHECK) .Dockerfile
	$(YAMLLINT) -c .yamllint.yml -f parsable **/*.yml

yamllint: ## Run yamllint on specific files and check for specific conditions
	$(YAMLLINT) ./github-workflow.yml --no-warnings >/dev/null 2>&1 && echo OK
	$(YAMLLINT) ./release_drafter.yml --no-warnings >/dev/null 2>&1 && echo OK
	$(YQ) eval '.jobs.*.steps.[].name' ./github-workflow.yml | wc -l
	$(YQ) eval '.jobs.*.steps.[].run' ./github-workflow.yml | grep -q 'make lint' && echo OK
	$(YQ) eval '.jobs.*.steps.[].run' ./github-workflow.yml | grep -q 'make integration-test'

markdownlint: ## Lint the Markdown files
	$(MARKDOWN) README.md
	$(MARKDOWN) DEPLOY.md

test: ## Run tests for the API
	@make build
	@make unit-tests
	@make integration-tests

unit-tests: ## Run unit tests using go test
	go test -v -short -coverprofile=coverage-units.out

integration-tests: ## Run integration tests using go test
	go test -v -coverprofile=coverage-integrations.out

validate: ## Check if the current directory is correct
	pwd

package: ## Create a zip archive of the dist folder and API binary
	docker build -t awesome:${IMAGE_TAG} .
	docker save -o awesome_image.tar awesome:${IMAGE_TAG}
	zip awesome-website.zip awesome-api dist/ awesome_image.tar

help: ## Print the list of targets and their usage
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
