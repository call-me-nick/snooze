.PHONY: default build run test buildwin

default:
	@grep -E '^[a-z]' Makefile | grep -v default | sed -e 's/:/ /'

build:
	go build genlinks.go
	mv genlinks ..

run: build
	../genlinks

test: build
	cd ../test_data; ../genlinks

# Cross compiling!
# https://github.com/golang/go/wiki/WindowsCrossCompiling

buildwin:
	cd src_hello && GOOS=windows GOARCH=386 go build -o hello.exe hello.go
