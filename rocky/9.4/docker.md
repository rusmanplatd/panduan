# Docker

## Installation

### Set up Docker's repository

```sh
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

### Install the Docker packages

```sh
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### Verify Docker Engine installation

```sh
sudo docker run hello-world
```

## post-installation steps for Docker Engine

### Create the docker group

```sh
sudo groupadd docker
```

### Add your user to the docker group

```sh
sudo usermod -aG docker $USER
```

### Log out and log back in so that your group membership is re-evaluated

If you're running Linux in a virtual machine, it may be necessary to restart the virtual machine for changes to take effect.

```sh
newgrp docker
```

### Verify that you can run docker commands without sudo

```sh
docker run hello-world
```

## Configure Docker to start on boot with systemd

```sh
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
```
