# Install Prometheus Node Exporter

https://ourcodeworld.com/articles/read/1686/how-to-install-prometheus-node-exporter-on-ubuntu-2004

## Download Node Exporter

```sh
cd ~
wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
```

## Extract Node Exporter and move binary

```sh
tar xvf node_exporter-1.7.0.linux-amd64.tar.gz
cd node_exporter-1.7.0.linux-amd64
sudo cp node_exporter /usr/local/bin
cd ..
rm -rf ./node_exporter-1.7.0.linux-amd64
```

## Create Node Exporter User

```sh
sudo useradd --no-create-home --shell /bin/false node_exporter
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
```

## Create and start the Node Exporter service

```sh
sudo nano /etc/systemd/system/node_exporter.service
```

```conf
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter
```

## Test the Node Exporter service

http://127.0.0.1:9100/metrics

```
# HELP go_gc_duration_seconds A summary of the pause duration of garbage collection cycles.
# TYPE go_gc_duration_seconds summary
go_gc_duration_seconds{quantile="0"} 2.5948e-05
go_gc_duration_seconds{quantile="0.25"} 2.9566e-05
go_gc_duration_seconds{quantile="0.5"} 3.0488e-05
go_gc_duration_seconds{quantile="0.75"} 3.2111e-05
go_gc_duration_seconds{quantile="1"} 0.000232387
go_gc_duration_seconds_sum 1.454063444
go_gc_duration_seconds_count 23486
# HELP go_goroutines Number of goroutines that currently exist.
# TYPE go_goroutines gauge
go_goroutines 9
# HELP go_info Information about the Go environment.
# TYPE go_info gauge
go_info{version="go1.17.3"} 1
# HELP go_memstats_alloc_bytes Number of bytes allocated and still in use.
# TYPE go_memstats_alloc_bytes gauge
go_memstats_alloc_bytes 2.365264e+06
# HELP go_memstats_alloc_bytes_total Total number of bytes allocated, even if freed.
# TYPE go_memstats_alloc_bytes_total counter
go_memstats_alloc_bytes_total 5.0367212352e+10
# HELP go_memstats_buck_hash_sys_bytes Number of bytes used by the profiling bucket hash table.
# TYPE go_memstats_buck_hash_sys_bytes gauge
go_memstats_buck_hash_sys_bytes 1.897095e+06
```

## If port 9100 is unreachable

```sh
sudo ufw allow 9100
# OR
sudo iptables -I INPUT -p tcp -m tcp --dport 9100 -j ACCEPT
```
