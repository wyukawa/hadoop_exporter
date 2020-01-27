all: namenode_exporter resourcemanager_exporter
.PHONY: all

namenode_exporter: namenode_exporter.go
	go build namenode_exporter.go

resourcemanager_exporter: resourcemanager_exporter.go
	go build resourcemanager_exporter.go

clean:
	rm -rf namenode_exporter resourcemanager_exporter
