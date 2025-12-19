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
sudo apt install -y 7zip bat build-essential btop ca-certificates certbot clang clangd cmake codeblocks curl g++ fd-find ffmpeg firewall-config gcc gdb gh git
sudo apt install -y git-lfs gnupg2 htop imagemagick jq libfontconfig1-dev libgtk-3-dev libncursesw5-dev libreadline-dev libxcb-xfixes0-dev libxkbcommon-dev
sudo apt install -y lsb-release lua-language-server make mandpages-dev mariadb-server maven mesa-utils neofetch ninja-build nginx nmap openjdk-21-jdk pipx
sudo apt install -y pkg-config poppler-utils postgresql-common python3.12 python3-certbot-nginx python3.12-venv python3.12-dev python3-pip ripgrep resvg
sudo apt install -y software-properties-common tmux ubuntu-keyring vagrant viu w3m wget
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
pip3 install debugpy ueberzug
# pip3 install --upgrade pip setuptools wheel
# pip3 install black isort flake8 mypy pytest
pip3 install --user black flake8 isort mypy pyright python-lsp-server pylint pytest ruff ruff-lsp sqlfluff
pipx install black flake8 isort mypy pyright python-lsp-server pylint pytest ruff ruff-lsp
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
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v2.7.2
go install github.com/air-verse/air@latest
go install mvdan.cc/gofumpt@latest
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/gopls@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install github.com/jesseduffield/lazydocker@latest
go install github.com/jesseduffield/lazygit@latest
sudo apt install php8.4 php8.4-cli php8.4-common php8.4-fpm php8.4-mysql php8.4-mbstring php8.4-gd php8.4-imagick php8.4-bcmath php8.4-curl php8.4-dev php8.4-intl php8.4-ldap php8.4-pgsql php8.4-redis php8.4-uploadprogress php8.4-xdebug php8.4-zip php8.4-xml php8.4-odbc
cd ~/Downloads
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --install-dir=/usr/bin --filename=composer --2
sudo php composer-setup.php --install-dir=/usr/bin --filename=composer2 --2
sudo php composer-setup.php --install-dir=/usr/bin --filename=composer1 --1
composer global require friendsofphp/php-cs-fixer
curl -fsSL https://bun.com/install | bash
curl -fsSL https://deno.land/install.sh | sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source ~/.bashrc
nvm install 24
nvm alias default 24
npm i -g npm
npm i -g @tailwindcss/language-server @angular/language-server blade-formatter emmet-ls eslint intelephense vls vscode-langservers-extracted
npm i -g pnpm prettier pyright sql-formatter stylelint stylelint-config-standard typescript typescript-language-server yaml-language-server yarn
nvm install 22
nvm install 20
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source ~/.cargo/env
rustup component add rust-analyzer rustfmt clippy
cargo install taplo-cli --locked
mkdir -p ~/github.com/junegunn
cd ~/github.com/junegunn
git clone https://github.com/junegunn/fzf
cd fzf && ./install --all
mkdir -p ~/github.com/jarun
cd ~/github.com/jarun
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
cd ~/Downloads
# https://github.com/grafana/k6-studio/releases
wget https://github.com/grafana/k6-studio/releases/download/v1.9.0/k6-studio_1.9.0_amd64.deb
sudo dpkg -i k6-studio_1.9.0_amd64.deb
# https://github.com/grafana/k6/releases
wget https://github.com/grafana/k6/releases/download/v1.4.2/k6-v1.4.2-linux-amd64.deb
sudo dpkg -i k6-v1.4.2-linux-amd64.deb
mkdir -p ~/Downloads/fonts && cd ~/Downloads/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip
sudo mkdir -p /usr/share/fonts/JetBrainsMono
sudo mv *.ttf /usr/share/fonts/JetBrainsMono/
fc-cache -fv
sudo snap install nvim --classic --edge
cd ~/.config
rm -rf nvim
git clone https://github.com/rusmanplatd/lazyvim nvim
cd ~/Downloads
wget https://github.com/RazrFalcon/resvg/releases/latest/download/resvg-linux-x86_64.tar.gz
tar -xzf resvg-linux-x86_64.tar.gz
sudo mv resvg /usr/local/bin/
resvg --version
sudo snap install yazi --classic --edge
