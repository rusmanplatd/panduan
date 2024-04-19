# Docker

## Installation

### Set up Docker's apt repository

```sh
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

### Install the Docker packages

```sh
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
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
