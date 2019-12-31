default:
	@echo "make push ?"

push:
	git add *
	git commit -m "$$(date)"
	git push

