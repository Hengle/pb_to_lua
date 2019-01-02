set GOPATH="%~dp0"

set GOARCH=amd64
set GOOS=windows
go build -o bin/pbtolua.exe lixiuzhi/pbtool

pause