.PHONY: test lint lint-all lint-examples tools

test:
	go test *.go

lint:
	golangci-lint run -v

tools:
	curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(GOPATH)/bin v1.42.1
	go get github.com/davecgh/go-spew/spew@v1.1.0
