# Hadoop Exporter for Prometheus
Exports hadoop metrics via HTTP for Prometheus consumption.

How to build
```
make namenode_exporter
make resourcemanager_exporter
```

Help on flags of namenode_exporter:
```
-namenode.jmx.url string
    Hadoop JMX URL. (default "http://localhost:50070/jmx")
-web.listen-address string
    Address on which to expose metrics and web interface. (default ":9070")
-web.telemetry-path string
    Path under which to expose metrics. (default "/metrics")
```

Help on flags of resourcemanager_exporter:
```
-resourcemanager.url string
    Hadoop ResourceManager URL. (default "http://localhost:8088")
-web.listen-address string
    Address on which to expose metrics and web interface. (default ":9088")
-web.telemetry-path string
    Path under which to expose metrics. (default "/metrics")
```

Tested on HDP2.3
