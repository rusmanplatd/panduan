# Install Prometheus

https://www.cherryservers.com/blog/install-prometheus-ubuntu

## Update System Packages

```sh
cd ~
sudo apt update
```

## Create a System User for Prometheus

```sh
sudo groupadd --system prometheus
sudo useradd -s /sbin/nologin --system -g prometheus prometheus
```

## Create Directories for Prometheus

```sh
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
```

## Download Prometheus and Extract Files

```sh
wget https://github.com/prometheus/prometheus/releases/download/v2.51.0/prometheus-2.51.0.linux-amd64.tar.gz
tar vxf prometheus-2.51.0.linux-amd64.tar.gz
```

## Navigate to the Prometheus Directory

- `cd prometheus-2.51.0.linux-amd64`

## Move the Binary Files & Set Owner

```sh
sudo mv prometheus /usr/local/bin
sudo mv promtool /usr/local/bin
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
```

## Move the Configuration Files & Set Owner

```sh
sudo mv consoles /etc/prometheus
sudo mv console_libraries /etc/prometheus
sudo mv prometheus.yml /etc/prometheus

sudo chown prometheus:prometheus /etc/prometheus
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
sudo chown -R prometheus:prometheus /var/lib/prometheus

sudo nano /etc/prometheus/prometheus.yml
```

```yaml
# my global config
global:
  scrape_interval: 15s # Set the scrape interval to every 15 seconds. Default is every 1 minute.
  evaluation_interval: 15s # Evaluate rules every 15 seconds. The default is every 1 minute.
  # scrape_timeout is set to the global default (10s).

# Alertmanager configuration
alerting:
  alertmanagers:
    - static_configs:
        - targets:
          # - alertmanager:9093

# Load rules once and periodically evaluate them according to the global 'evaluation_interval'.
rule_files:
  # - "first_rules.yml"
  # - "second_rules.yml"

# A scrape configuration containing exactly one endpoint to scrape:
# Here it's Prometheus itself.
scrape_configs:
  # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
  - job_name: "prometheus"

    # metrics_path defaults to '/metrics'
    # scheme defaults to 'http'.

    static_configs:
      - targets: ["localhost:9090"]
```

## Create Prometheus Systemd Service

```sh
sudo nano /etc/systemd/system/prometheus.service
```

```conf
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
    --config.file /etc/prometheus/prometheus.yml \
    --storage.tsdb.path /var/lib/prometheus/ \
    --web.console.templates=/etc/prometheus/consoles \
    --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
```

prometheus.service

## Reload Systemd

```sh
sudo systemctl daemon-reload
```

## Start Prometheus Service

```sh
# sudo systemctl unmask prometheus
sudo systemctl enable prometheus
sudo systemctl start prometheus
```

## Check Prometheus Status

```sh
sudo systemctl status prometheus
```

## Access Prometheus Web Interface

```sh
sudo ufw allow 9090/tcp
```
