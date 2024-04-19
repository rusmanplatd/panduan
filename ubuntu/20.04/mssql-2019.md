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
- `curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list`
- `sudo apt-get update`
- `sudo apt-get install mssql-tools unixodbc-dev`
  - Yes
  - Yes
- `echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile`
- `echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc`
- `source ~/.bashrc`
- `sqlcmd -S localhost -U sa -P 'YourStrongP4$$word'`
  - `CREATE DATABASE ams_patriot;`
  - `SELECT Name from sys.databases;`
  - `GO`
- `sqlcmd -S localhost -U sa -P 'YourStrongP4$$word'`
  - `EXEC sp_configure 'remote access', 0;`
  - `GO`
  - `RECONFIGURE;`
  - `GO`
- `sudo ufw allow 1433/tcp`

## Add your user to the mssql group

```sh
sudo usermod -aG mssql $USER
```

## Membuat Database

- menggunakan `sqlcmd`
  - `sqlcmd -S localhost -U sa -P 'YourStrongP4$$word'`
    - `CREATE DATABASE rucika;`
    - `GO`
- menggunakan [adminer.hs](http://adminer.hs)
  - login
  - buat database

## Menghapus Database

- menggunakan `sqlcmd`
  - `sqlcmd -S localhost -U sa -P 'YourStrongP4$$word'`
    - `DROP DATABASE [rucika]`

## Backup Database

```sh
sudo rm /var/opt/mssql/data/rucika.bak
sqlcmd -S localhost -U sa -P 'YourStrongP4$$word' -Q "BACKUP DATABASE [rucika] TO  DISK = N'/var/opt/mssql/data/rucika.bak' WITH NOFORMAT, NOINIT,  NAME = N'rucika', NOSKIP, REWIND, NOUNLOAD,  STATS = 10"
```

## Restore a database

```sh
sqlcmd -S localhost -U sa -P 'YourStrongP4$$word' -Q "USE [master] RESTORE DATABASE [rucika] FROM  DISK = N'/var/opt/mssql/data/rucika.bak' WITH  FILE = 1,  NOUNLOAD,  STATS = 5"
```
