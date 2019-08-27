# Hadoop Exporter for Prometheus
Exports hadoop metrics via HTTP for Prometheus consumption.

How to build
```
go get github.com/prometheus/client_golang/prometheus
go get github.com/prometheus/log
go build namenode_exporter.go
go build resourcemanager_exporter.go
```

Help on flags of namenode_exporter:
```
-namenode.jmx.url string
    Hadoop JMX URL. (default "http://localhost:50070/jmx")
-web.listen-address string
    Address on which to expose metrics and web interface. (default ":9070")
-web.telemetry-path string
    Path under which to expose metrics. (default "/metrics")
-const.labels cluster:hd1;idc:idc1
    Const Lables
```

Help on flags of resourcemanager_exporter:
```
-resourcemanager.url string
    Hadoop ResourceManager URL. (default "http://localhost:8088")
-web.listen-address string
    Address on which to expose metrics and web interface. (default ":9088")
-web.telemetry-path string
    Path under which to expose metrics. (default "/metrics")
-const.labels cluster:hd1;idc:idc1
    Const Lables
```

Tested on HDP2.3, CDH5.x
