build:
    docker run --volume ${GITHUB_WORKSPACE}/module4_task2/:/go golang:1.15.8-alpine ls && go build
    /usr/local/bin/hugo

build-docker:
    docker build -t awesome:build ./.build

run:
    ./awesome-api >./awesome-api.log 2>&1 &

stop:
    pkill awesome-api

lint: build-docker
    docker run --rm -v "$(PWD)":/usr/src/myapp -w /usr/src/myapp awesome:build markdownlint DEPLOY.md README.md

docker-tests:
    -make build-docker
    container-structure-test test --image awesome:build --config ./.build/cst.yml

test:
    @make unit-tests
    @make integration-tests
    @make validate

unit-tests:
    docker run --volume ${GITHUB_WORKSPACE}/module4_task2/:/go golang:1.15.8-alpine ls && go test -v -short -coverprofile=coverage-units.out

integration-tests:
    docker run --volume ${GITHUB_WORKSPACE}/module4_task2/:/go golang:1.15.8-alpine ls && go test -v -coverprofile=coverage-integrations.out

clean:
    make stop || true
    pkill awesome-api || true
    rm -rf awesome-api awesome-api.log coverage-units.out coverage-integrations.out
    rm -rf dist/*

post:
    hugo new posts/$(POST_NAME).md
    sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

validate:
    ./w3c_validator.py ./dist/index.html || true

help:
    grep -E -i ^[a-z] Makefile | sed 's/ check//' | sed 's/ build-docker//' | tr -d '##'

package:
    make build
    zip -r awesome-website.zip awesome-api dist/

lint-docker: build-docker
    docker container run --rm -i hadolint/hadolint < .build/
