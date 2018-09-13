all: namenode_exporter resourcemanager_exporter
.PHONY: all

deps:
	go get github.com/prometheus/client_golang/prometheus
	go get github.com/prometheus/log

namenode_exporter: deps namenode_exporter.go
	go build namenode_exporter.go

resourcemanager_exporter: deps resourcemanager_exporter.go
	go build resourcemanager_exporter.go

clean:
	rm -rf namenode_exporter resourcemanager_exporter
