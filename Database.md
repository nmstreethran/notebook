- [XAMPP](#xampp)
  - [Install new phpMyAdmin themes](#install-new-phpmyadmin-themes)
  - [Fix server issues](#fix-server-issues)
- [MariaDB](#mariadb)

## XAMPP

<https://www.apachefriends.org/faq_linux.html>

XAMPP can be installed using the installer downloaded from the website, or using AUR + Pamac on Manjaro.

After installation, try starting XAMPP:

```sh
sudo /opt/lampp/lampp start
```

Using the GUI:

```sh
sudo /opt/lampp/manager-linux-x64.run
```

A shortcut to this GUI can be created on KDE with the following command:

```sh
kdesu /opt/lampp/manager-linux-x64.run
```

There's no need to fix the security weaknesses for local development; doing so can cause additional issues. See:

- <https://stackoverflow.com/q/68677283>
- <https://community.apachefriends.org/viewtopic.php?p=272515>

Restarting XAMPP:

```sh
sudo /opt/lampp/lampp restart
```

To stop XAMPP:

```sh
sudo /opt/lampp/lampp stop
```

To launch MariaDB (after starting XAMPP):

```sh
/opt/lampp/bin/mariadb -u root -p db_name
```

### Install new phpMyAdmin themes

Download a theme and extract it to `/opt/lampp/phpmyadmin/themes/`.

- <https://www.phpmyadmin.net/themes/>
- <https://github.com/phpmyadmin/themes>

### Fix server issues

If a server won't connect, it is usually caused by a blocked port. For example, if MySQL won't run, change its port number from `3306` to `8080`.

- <https://httpd.apache.org/docs/current/bind.html>
- <https://stackoverflow.com/q/27754367>
- <https://themeisle.com/blog/xampp-error-apache-shutdown-unexpectedly/>
- <https://stackoverflow.com/q/49127318>

The following may be necessary if simply changing the port number from the XAMPP GUI doesn't work:

Change the port in `opt/lampp/etc/httpd.conf`:

- `Port 80` to `Port 8080`
- `Listen 80` to `Listen 8080`
- `servername localhost: 80` to `servername localhost: 8080`

Change the port in `opt/lampp/etc/extra/httpd-ssl.conf`:

- `Listen 443` to `Listen 4433`
- `<VirtualHost_default_:443>` to `<VirtualHost_default_:4433>`
- `ServerName www.example.com:443` to `ServerName www.example.com:4433`

Close all XAMPP services and restart.

## MariaDB

- CLI: <https://mariadb.com/kb/en/mysql-command-line-client/>
- SQL: <https://mariadb.com/kb/en/sql-statements-structure/>

Launch MariaDB (remove password flag, `-p`, if necessary):

```sh
mariadb -u root -p
```

Create a database (with options for exception handling):

```mysql
CREATE DATABASE db_name;
CREATE OR REPLACE DATABASE db_name;
CREATE DATABASE IF NOT EXISTS db_name;
```

Connect to or change a database:

```sh
mariadb -u root -p db_name
```

within MariaDB:

```mysql
USE db_name;
```

Delete a database (with an option for exception handling):

```mysql
DROP DATABASE db_name;
DROP DATABASE IF EXISTS db_name;
```

List all databases in the server:

```mysql
SHOW DATABASES;
```

Delete a table within a database:

```mysql
DROP TABLE table_name;
```

List all tables in a database:

```mysql
SHOW TABLES;
```

Create a new user (password is optional):

```mysql
CREATE USER secondary@localhost IDENTIFIED BY 'password';
CREATE OR REPLACE USER secondary@localhost IDENTIFIED BY 'password';
CREATE USER IF NOT EXISTS secondary@localhost IDENTIFIED BY 'password';
```

Grant full privileges to the new user:

```mysql
GRANT ALL PRIVILEGES ON *.* TO secondary@localhost;
```

Additional account management options: <https://mariadb.com/kb/en/account-management-sql-commands/>, <https://mariadb.com/kb/en/grant/>
