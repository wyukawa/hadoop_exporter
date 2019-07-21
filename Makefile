# ###############
# Go Project
# ###############
CPWD ?= $(PWD)
BIN_PATH ?= ./cmd
BIN_NAMES ?= namenode-exporter resourcemanager-exporter
GO_FLAGS ?= GOOS=linux GOARCH=amd64
export GO111MODULE=on

all: build
.PHONY: all

deps:
	@mkdir ./bin || true

build: deps
	@for CMD in $(BIN_NAMES); do \
		cd $(CPWD)/$(BIN_PATH)/$${CMD}; \
		echo -e "** Building cmd: $${CMD} **"; \
		GOOS=linux GOARCH=amd64 \
		$(GO_FLAGS) go build -o $(CPWD)/bin/$${CMD}; \
	done
	@cd $(CPWD)

clean:
	rm -rfv bin/*
