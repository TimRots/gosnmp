#!/bin/bash

/etc/init.d/snmpd restart
go test -v -tags helper
go test -v -tags marshal
go test -v -tags misc
go test -v -tags api
go test -v -tags trap
go test -v -tags end2end
go test -v -tags all -race
