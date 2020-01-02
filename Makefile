default:
	@echo "make push ?"

push:
	git add Makefile *ps1 *md .gitignore
	git commit -m "$$(date +%Y%m%d_%H%M)"
	git push
