# Install Laragon

- Laragon
  - [page](https://laragon.org/download/index.html)
  - [binary](https://github.com/leokhoa/laragon/releases/download/6.0.0/laragon-wamp.exe)

## Tambahkan PHP Versi 8.1.26

- Download PHP 8.1.26 Thread Safe untuk Windows
  - [page](https://windows.php.net/download/)
  - [binary](https://windows.php.net/downloads/releases/php-8.1.26-Win32-vs16-x64.zip)
- extract ke `C:\laragon\bin\php\php-8.1.26-Win32-vs16-x64`
- buka aplikasi laragon
- ganti versi php ke `8.1.26`
- restart webserver laragon

## Install extension PHP sqlsrv

- ODBC Sqlsrv `msodbcsql.msi`
  - [page](https://learn.microsoft.com/en-us/sql/connect/odbc/download-odbc-driver-for-sql-server?view=sql-server-ver16#version-17)
  - [binary](https://go.microsoft.com/fwlink/?linkid=2249004)
- Download PHP sqlsrv extension `SQLSRV511.ZIP`
  - [page](https://learn.microsoft.com/en-us/sql/connect/php/release-notes-php-sql-driver?view=sql-server-linux-ver15)
  - [binary](https://go.microsoft.com/fwlink/?linkid=2246325)
- extract `SQLSRV511.ZIP`
- copy `php_sqlsrv_81_ts_x86.dll` ke `C:\laragon\bin\php\php-8.1.26-Win32-vs16-x64\ext`
- rename `php_sqlsrv_81_ts_x86.dll` jadi `php_sqlsrv.dll`
- buka file `C:\laragon\bin\php\php-8.1.26-Win32-vs16-x64\php.ini` tambahkan `extension=sqlsrv`
- restart webserver laragon

## Project Laravel

- buka terminal, masuk ke folder homestead
- `vagrant ssh`
- `cd /var/www/html`
- clone project laravel
- `cp .env.example .env`
- konfigurasi file `.env`
  - jika menggunakan db sqlsrv

    ```.env
    DB_CONNECTION=sqlsrv
    DB_HOST=localhost
    DB_PORT=1433
    DB_USERNAME=sa
    DB_PASSWORD=YourStrongP4$$word
    DB_DATABASE=mydatabasename
    ```

- `composer install`
- `php artisan storage:link`
- `php artisan migrate:fresh --seed`
