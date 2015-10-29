
build:
	@docker build -t cusspvz/sinopia .

run: build
	@echo "Be ready to access http://localhost:4873"
	@docker run \
		-ti --rm \
		--name=sinopia \
		-p 4873:4873/tcp \
		cusspvz/sinopia

fix-permissions:
	@chmod +x $$(find . | grep ".sh$$")
