default:
	@grep -E '^[a-z]' Makefile | grep -v default | sed -e 's/:/ /'

build:
	go build genlinks.go
	