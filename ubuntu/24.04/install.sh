sudo apt update
sudo apt full-upgrade -y
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
ln -s $(which fdfind) ~/.local/bin/fd
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
sudo apt remove apache2 apache-*
sudo add-apt-repository ppa:ondrej/php -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo add-apt-repository ppa:git-core/ppa -y
sudo add-apt-repository ppa:ubuntuhandbook1/ffmpeg7 -y
curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" | sudo tee /etc/apt/sources.list.d/nginx.list
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install -y bat build-essential btop ca-certificates certbot curl fd-find ffmpeg firewall-config gcc gh git git-lfs gnupg2 htop jq libncursesw5-dev libreadline-dev lsb-release make mariadb-server maven neofetch nginx nmap openjdk-21-jdk pkg-config postgresql-common python3.12 python3-certbot-nginx python3.12-venv python3.12-dev ripgrep software-properties-common tmux ubuntu-keyring vagrant wget
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
# git config --global credential.helper store
# git config --global user.email "you@example.com"
# git config --global user.name "Your Name"
# ssh-keygen -t ed25519 -C "<comment>"
# ssh-keygen -o -t rsa -b 4096 -C "<comment>"
# ssh -T git@github.com
# ssh -T git@gitlab.com
# gpg --full-gen-key
# gpg --list-secret-keys --keyid-format LONG <EMAIL>
# gpg --armor --export <ID>
# git config --global user.signingkey <ID>
# git config --global commit.gpgsign true
echo 'alias python=python3' >> ~/.bashrc
echo 'alias pip=pip3' >> ~/.bashrc
curl -LsSf https://astral.sh/uv/install.sh | sh
source ~/.bashrc
# pip3 install --upgrade pip setuptools wheel
# pip3 install black isort flake8 mypy pytest
sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh
sudo apt install postgresql-18
# sudo -u postgres psql
# \password postgres
# Your_Strong_P455word
# \q
# CREATE USER userdb WITH PASSWORD 'Your_Strong_P455word';
# CREATE ROLE userdb LOGIN PASSWORD 'Your_Strong_P455word';
# GRANT ALL PRIVILEGES ON DATABASE db_name TO userdb;
# GRANT ALL PRIVILEGES ON SCHEMA schema_name TO username;
# GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO userdb;
# GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO userdb;
sudo snap install pinta redis redisinsight tree vlc yq yt-dlp
sudo snap install go microk8s --classic
sudo snap install gradle --channel=latest/edge --classic
go install github.com/jesseduffield/lazydocker@latest
go install github.com/jesseduffield/lazygit@latest
go install github.com/air-verse/air@latest
sudo apt install php8.4 php8.4-cli php8.4-common php8.4-fpm php8.4-mysql php8.4-mbstring php8.4-gd php8.4-imagick php8.4-bcmath php8.4-curl php8.4-dev php8.4-intl php8.4-ldap php8.4-pgsql php8.4-redis php8.4-uploadprogress php8.4-xdebug php8.4-zip php8.4-xml php8.4-odbc
cd ~
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --install-dir=/usr/bin --filename=composer --2
sudo php composer-setup.php --install-dir=/usr/bin --filename=composer2 --2
sudo php composer-setup.php --install-dir=/usr/bin --filename=composer1 --1
curl -fsSL https://bun.com/install | bash
curl -fsSL https://deno.land/install.sh | sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source ~/.bashrc
nvm install 24
nvm alias default 24
npm i -g npm yarn pnpm @anthropic-ai/claude-code
nvm install 22
nvm install 20
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source ~/.cargo/env
cd ~
git clone https://github.com/junegunn/fzf
~/fzf/install --all
git clone https://github.com/jarun/nnn
cd nnn
sudo make install
cd /var/www/html
sudo chmod 775 -R .
sudo chown $USER:www-data -R .
mkdir -p /var/www/html/adminer
cd /var/www/html/adminer
wget https://github.com/vrana/adminer/releases/download/v5.4.1/adminer-5.4.1.php -O index.php
wget https://www.adminer.org/download/v5.4.1/designs/hever/adminer.css -O adminer.css
cd ~

