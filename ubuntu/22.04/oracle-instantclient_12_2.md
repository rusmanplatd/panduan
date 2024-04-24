# Install instantclient_12_2

- `sudo apt install systemtap-sdt-dev build-essential libaio1`
- extract [instantclient_12_2.zip](../app/instantclient_12_2.zip)
- `sudo mkdir /opt/oracle`
- `sudo mv instantclient_12_2 /opt/oracle`
- `sudo su`
  - `cd /opt/oracle/instantclient_12_2/oci8-3.3.0`
  - `pecl config-set php_ini /etc/php/8.3/cli/php.ini`
  - `export PHP_DTRACE=yes`
  - `phpize`
  - `./configure --with-oci8=instantclient,/opt/oracle/instantclient_12_2`
  - `make`
  - `make install`
  - `systemctl edit php8.3-fpm`

    ```.conf
    [Service]
    Environment=LD_LIBRARY_PATH=/opt/oracle/instantclient_2_2
    ```

  - `nano /etc/environment`

    ```.conf
    LD_LIBRARY_PATH=/opt/oracle/instantclient_12_2:$LD_LIBRARY_PATH
    ORACLE_HOME=/opt/oracle/instantclient_12_2
    # append to PATH variable :$LD_LIBRARY_PATH
    ```

  - `nano /etc/php/8.3/fpm/pool.d/www.conf`

    ```.conf
    env[LD_LIBRARY_PATH] = /opt/oracle/instantclient_12_2:$LD_LIBRARY_PATH
    ```

  - `sudo echo "extension=oci8" >> /etc/php/8.3/mods-available/oci8.ini`
  - `sudo ln -s /etc/php/8.3/mods-available/oci8.ini /etc/php/8.3/cli/conf.d/10-oci8.ini`
  - `sudo ln -s /etc/php/8.3/mods-available/oci8.ini /etc/php/8.3/fpm/conf.d/10-oci8.ini`
  - `systemctl restart php8.3-fpm`
