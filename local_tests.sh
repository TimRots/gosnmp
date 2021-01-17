#!/bin/bash

/etc/init.d/snmpd restart
#go get -t -u ./...
#&& GO111MODULE=on go get github.com/golang/mock/mockgen@v1.4.4
#$GOPATH/bin/mockgen -source=interface.go -destination=mocks/gosnmp_mock.go -package=mocks
#go test -v -tags helper
#go test -v -tags marshal
#go test -v -tags misc
#go test -v -tags api
go test -v -tags trap
#go test -v -tags end2end
#go test -v -tags all -race
