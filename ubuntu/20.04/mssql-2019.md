# Install MSSQL Server 2019

- Jika menggunakan VM Homestead
  - buka terminal, masuk ke folder homestead
  - `vagrant ssh`
- `cd ~`
- `curl https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc`
- `sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2019.list)"`
- `sudo apt-get update`
- `sudo apt-get install -y mssql-server`
- `sudo /opt/mssql/bin/mssql-conf setup`
  - 3 (Express)
  - Yes
  - YourStrongP4$$word
- `curl https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc`
- `curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release list`
- `sudo apt-get update`
- `sudo apt-get install mssql-tools unixodbc-dev`
  - Yes
  - Yes
- `echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile`
- `echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc`
- `source ~/.bashrc`
- `sqlcmd -S localhost -U sa -P 'YourStrongP4$$word'`
- `EXEC sp_configure 'remote access', 0;`
- `GO`
- `RECONFIGURE;`
- `GO`
- `sudo ufw allow 1433/tcp`

## Membuat Database

- menggunakan `sqlcmd`
  - `sqlcmd -S localhost -U sa -P 'YourStrongP4$$word'`
    - `CREATE DATABASE mydatabasename;`
    - `GO`
- menggunakan [adminer.hs](http://adminer.hs)
  - login
  - buat database
