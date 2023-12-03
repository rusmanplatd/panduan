# Install PHP sqlsrv extension

- Masuk ke VM Ubuntu
  - buka terminal, masuk ke folder homestead
  - `vagrant ssh`
- `cd ~`
- `sudo pecl install sqlsrv`
- `sudo pecl install pdo_sqlsrv`
- `sudo su`
- `printf "; priority=20\nextension=sqlsrv.so\n" > /etc/php/8.1/mods-available/sqlsrv.ini`
- `printf "; priority=30\nextension=pdo_sqlsrv.so\n" > /etc/php/8.1/mods-available/pdo_sqlsrv.ini`
- `exit`
- `sudo phpenmod -v 8.1 sqlsrv pdo_sqlsrv`
