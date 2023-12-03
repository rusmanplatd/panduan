# Set up Windows

## Install Aplikasi

- install virtual box
- install vagrant

## Homestead

### Install Homestead

- buka terminal
- clone homestead di folder www (laragon/xampp)
- `git clone https://github.com/laravel/homestead`
- `cd homestead`
- buat ssh dengan empty passphrase
- `ssh-keygen -t rsa -C "<your_email_address>"`
- `init.bat`
- sesuaikan file Homestead.yaml
- `vagrant up`
- daftarkan domain virtual host di C:\Windows\System32\drivers\etc\hosts

### Command Homestead

| Keterangan          | Command             |
| ------------------- | ------------------- |
| Menyalakan VM       | `vagrant up`        |
| Restart VM          | `vagrant provision` |
| Mematikan Homestead | `vagrant halt`      |
| Masuk ke VM         | `vagrant ssh`       |
| Keluar dari VM      | `exit`              |
|                     |                     |

## PHP

### Install extension PHP sqlsrv

- Download PHP ext SQLSRV511.ZIP https://go.microsoft.com/fwlink/?linkid=2246325
- extract SQLSRV511.ZIP kemudian copy `php_sqlsrv_81_ts_x86.dll` ke `C:\laragon\bin\php\php-8.1.10-Win32-vs16-x64\ext`
- file `php_sqlsrv_81_ts_x86.dll` disesuaikan dengan php yg digunakan, bisa saja `php_sqlsrv_81_nts_x86.dll`
- rename `php_sqlsrv_81_ts_x86.dll` jadi `php_sqlsrv.dll`
- buka file php.ini tambahkan `extension=sqlsrv`
- Download ODBC Sqlsrv msodbcsql.msi https://go.microsoft.com/fwlink/?linkid=2249004

### Laravel

buka terminal, masuk ke folder homestead
`vagrant ssh`

## Database Client

### Adminer

#### [Homestead](http://adminer.hs)

| Field    | Value              |
| -------- | ------------------ |
| Sistem   | MS SQL (beta)      |
| Server   | localhost:1433     |
| Pengguna | sa                 |
| Sandi    | YourStrOngP@$$w0rd |

#### [Laragon](http://adminer.test)

| Field    | Value              |
| -------- | ------------------ |
| Sistem   | MS SQL (beta)      |
| Server   | 192.168.56.56:1433 |
| Pengguna | sa                 |
| Sandi    | YourStrOngP@$$w0rd |
