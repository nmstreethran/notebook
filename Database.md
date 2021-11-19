- [XAMPP](#xampp)
- [MySQL Workbench](#mysql-workbench)
  - [`org.freedesktop.secrets` issue on KDE](#orgfreedesktopsecrets-issue-on-kde)
  - [Server incompatibility issue](#server-incompatibility-issue)
  - [SSL issues](#ssl-issues)
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

### `org.freedesktop.secrets` issue on KDE

Install `gnome-keyring`

- <https://bbs.archlinux.org/viewtopic.php?id=244193>
- <https://redd.it/d8tjln>

### Server incompatibility issue

Caused by the use of MariaDB instead of MySQL, which isn't officially supported by Oracle's products

- <https://stackoverflow.com/q/35376109>
- <https://unix.stackexchange.com/a/271985>

### SSL issues

Downgrade to 8.0.26 (did not work on my end). On Manjaro:

```sh
sudo downgrade mysql-workbench
```

- <https://dba.stackexchange.com/q/199154>
- <https://downloads.mysql.com/archives/workbench/>
- <https://stackoverflow.com/a/52789610>
- <https://wiki.manjaro.org/index.php?title=Downgrading_packages>
- <https://stackoverflow.com/q/57774867>

## MariaDB

<https://mariadb.com/kb/en/mysql-command-line-client/>
