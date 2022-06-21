## help: print this help message
.PHONY: help
help:
	@echo "Usage:"
	@sed -n 's/^##//p' $(MAKEFILE_LIST) | column -t -s ':' |  sed -e 's/^/ /'

## test: run tests
.PHONY: test
test:
	go test -v ./...

## race: run tests with race detector
.PHONY: race
race:
	go test -race -v ./...

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
