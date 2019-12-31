default:
	@echo "make push ?"

push:
	git add *
	git commit -m "$$(date +%Y%m%d_%H%M)"
	git push

