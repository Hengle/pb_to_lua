#! /bin/bash
CURRENT=`pwd`
export GOPATH="${GOPATH}:${CURRENT}"
go build -o bin/pbtolua lixiuzhi/pbtool