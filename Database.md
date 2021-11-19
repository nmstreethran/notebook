- [XAMPP](#xampp)
- [MySQL Workbench](#mysql-workbench)
- [MariaDB](#mariadb)

## XAMPP

<https://www.apachefriends.org/faq_linux.html>

After installation, try starting XAMPP:

```sh
sudo /opt/lampp/lampp start
```

Using the GUI:

```sh
sudo /opt/lampp/manager-linux-x64.run
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

To fix Apache Web Server issues (usually caused by a blocked port):

- <https://httpd.apache.org/docs/current/bind.html>
- <https://stackoverflow.com/q/27754367>
- <https://themeisle.com/blog/xampp-error-apache-shutdown-unexpectedly/>
- <https://stackoverflow.com/q/49127318>

Change the port in `opt/lampp/etc/httpd.conf`:

- `Port 80` to `Port 8080`
- `Listen 80` to `Listen 8080`
- `servername localhost: 80` to `servername localhost: 8080`

Change the port in `opt/lampp/etc/extra/httpd-ssl.conf`:

- `Listen 443` to `Listen 4433`
- `<VirtualHost_default_:443>` to `<VirtualHost_default_:4433>`
- `ServerName www.example.com:443` to `ServerName www.example.com:4433`

Close all XAMPP services and restart.

## MySQL Workbench

To launch:

```sh
/usr/bin/mysql-workbench
```

<https://dev.mysql.com/doc/workbench/en/wb-launching-linux.html>

## MariaDB

<https://mariadb.com/kb/en/mysql-command-line-client/>
