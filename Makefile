default:
	@echo "make push ?"

push:
	git add Makefile *ps1 *md
	git commit -m "$$(date +%Y%m%d_%H%M)"
	git push
