APP_NAME = discord-spidey-bot
IMAGE_TAG ?= latest

.PHONY: build
build:
	docker build -t $(APP_NAME):$(IMAGE_TAG) .

.PHONY: run
run: build
	docker run --rm --env-file .env $(APP_NAME):$(IMAGE_TAG)

.PHONY: connect
connect: build
	docker run --rm --env-file .env -it $(APP_NAME):$(IMAGE_TAG) sh

