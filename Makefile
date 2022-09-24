SHELL=/bin/bash -e -o pipefail
PWD = $(shell pwd)
GO_BUILD= go build
GOFLAGS= CGO_ENABLED=0
DOCKER_REPO=rog-golang-buddies/template
DOCKER_TAG=latest

## help: Print this help message
.PHONY: help
help:
	@echo "Usage:"
	@sed -n 's/^##//p' $(MAKEFILE_LIST) | column -t -s ':' |  sed -e 's/^/ /'

## test: Run tests
.PHONY: test
test:
	go test -race -v ./...

## cover: Run tests and show coverage result
.PHONY: cover
cover:
	go test -v -coverprofile=coverage.out ./...
	go tool cover -func=coverage.out

## tidy: Cleanup and download missing dependencies
.PHONY: tidy
tidy:
	go mod tidy
	go mod verify

## vet: Examine Go source code and reports suspicious constructs
.PHONY: vet
vet:
	go vet ./...

## fmt: Format all go source files
.PHONY: fmt
fmt:
	go fmt ./...

## build: Build binary into bin/ directory
.PHONY: build
build:
	$(GOFLAGS) $(GO_BUILD) -a -v -ldflags="-w -s" -o bin/app cmd/main.go

## docker-build: Build docker image
.PHONY: docker-build
docker-build:
	docker build . -t $(DOCKER_REPO):$(DOCKER_TAG)

## docker-run: Run docker image built via `make docker-build`
.PHONY: docker-run
docker-run:
	docker run --rm $(DOCKER_REPO)

## docker: Build and run docker image
.PHONY: docker
docker: docker-build docker-run
