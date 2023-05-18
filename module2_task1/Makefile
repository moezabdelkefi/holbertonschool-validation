.PHONY: build run stop clean test help

BINARY_NAME := awesome-api
LOG_FILE := awesome-api.log
PORT := 9999


build: lint	##test
    go build -o awesome-api

run:	##test
	nohup ./$(BINARY_NAME) > $(LOG_FILE) 2>&1 &

stop:	##test
	kill `pgrep $(BINARY_NAME)`


clean: stop	## Clean the project directory
	rm -f $(BINARY_NAME) $(LOG_FILE)

test:	##test
	@curl -s "http://localhost:$(PORT)"
	@curl -s "http://localhost:$(PORT)/health"

help:	##test
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

lint:	##test
    golangci-lint run

