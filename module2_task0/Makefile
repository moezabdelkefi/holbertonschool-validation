.PHONY: build run stop clean test help

BINARY_NAME := awesome-api
LOG_FILE := awesome-api.log
PORT := 9999

build:
	go build -o $(BINARY_NAME)

run:
	nohup ./$(BINARY_NAME) > $(LOG_FILE) 2>&1 &

stop:
	kill `pgrep $(BINARY_NAME)`

clean: stop
	rm -f $(BINARY_NAME) $(LOG_FILE)

test:
	@curl -s "http://localhost:$(PORT)" || echo "404 Page Not Found"
	@curl -s "http://localhost:$(PORT)/health" || echo "Health Check Failed"
	@curl -s   "http://localhost:$(port) || echo "TESTFAILED"

help:
	@echo "Available targets:"
	@echo "  build   : Compile the source code to binary"
	@echo "  run     : Run the application in the background"
	@echo "  stop    : Stop the running application"
	@echo "  clean   : Stop the application and clean up binary and log files"
	@echo "  test    : Perform HTTP requests to test the server"
	@echo "  help    : Show this help message"
