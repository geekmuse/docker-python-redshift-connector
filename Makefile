IMAGE_NAME ?= python-redshift-connector
REPO ?= geekmuse
VSN ?= $(shell git describe --tags)

.DEFAULT_TARGET = build

.PHONY: build
build:
	@docker build -t $(IMAGE_NAME):$(VSN) .

.PHONY: repo_tag
repo_tag:
	@docker tag $(IMAGE_NAME):$(VSN) $(REPO)/$(IMAGE_NAME):$(VSN)

.PHONY: push
push:
	@docker push $(REPO)/$(IMAGE_NAME):$(VSN)

.PHONY: all
all: build repo_tag push