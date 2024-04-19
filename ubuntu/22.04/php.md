# Install PHP

## Menambahkan extension PHP sqlsrv

- Jika menggunakan VM Homestead
  - buka terminal, masuk ke folder homestead
  - `vagrant ssh`
- `cd ~`
- `sudo pecl config-set php_ini /etc/php/8.3/fpm/php.ini`
- `sudo pecl install sqlsrv`
- `sudo pecl install pdo_sqlsrv`
- `sudo su`
- `printf "; priority=20\nextension=sqlsrv.so\n" > /etc/php/8.3/mods-available/sqlsrv.ini`
- `printf "; priority=30\nextension=pdo_sqlsrv.so\n" > /etc/php/8.3/mods-available/pdo_sqlsrv.ini`
- `exit`
- `sudo phpenmod -v 8.3 sqlsrv pdo_sqlsrv`
