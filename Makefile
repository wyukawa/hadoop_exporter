# ###############
# Go Project
# ###############
CPWD ?= $(PWD)
BIN_PATH ?= ./cmd
BIN_NAMES ?= namenode-exporter resourcemanager-exporter
GO_FLAGS ?= GOOS=linux GOARCH=amd64
export GO111MODULE=on

# #######
# General
clean:
	rm -rfv bin/*

all: build
.PHONY: all

deps:
	@mkdir ./bin || true

# #######
# Builder

build: deps
	@for CMD in $(BIN_NAMES); do \
		cd $(CPWD)/$(BIN_PATH)/$${CMD}; \
		echo -e "** Building cmd: $${CMD} **"; \
		GOOS=linux GOARCH=amd64 \
		$(GO_FLAGS) go build -o $(CPWD)/bin/$${CMD}; \
	done
	@cd $(CPWD)

# #######
# Release
tag:
	$(call deps_tag,$@)
	git tag -a $(shell cat VERSION) -m "$(message)"
	git push origin $(shell cat VERSION)

tag-attach:
	@for CMD in $(BIN_NAMES); do \
		echo -e "** Publish bin to github: $${CMD} **"; \
		strip $(CPWD)/bin/$${CMD}; \
		./hack/github-tag-attachment.sh $(shell cat VERSION) $(CPWD)/bin/$${CMD}; \
	done
	@cd $(CPWD)
