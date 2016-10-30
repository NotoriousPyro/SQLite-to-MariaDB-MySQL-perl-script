# SQLite to MariaDB / MySQL perl script

Takes an SQLite compatible DB dump and converts it into a MariaDB / MySQL compatible DB dump.

Usage:`perl sqlite-to-mariadb.pl [INPUT FILE] > [OUTPUT FILE]`

Best used when put in the user's home dir. Example:
```
cp sqlite-to-mariadb.pl ~
chmod +x ~/sqlite-to-mariadb.pl
~/sqlite-to-mariadb.pl MyDBName.sqlite.sql > MyDBName.mariadb.sql
```

Example scenario:
```
sqlite3 YourDBName.sqlitedb .dump > YourDBName.sqlite.sql
~/sqlite-to-mariadb.pl YourDBName.sqlite.sql > YourDBName.mariadb.sql
mysql -uUSER -pPASSWORD YourDBName < YourDBName.mariadb.sql
```

This can be used for example, to convert the [Teamspeak 3 SQLite DB into a MariaDB](https://pyronexus.com/blog/2016/10/30/teamspeak-3-sqlite3-to-mariadb-mysql-guide/)-compatible DB.

Props to the original author [Shalmanese](http://stackoverflow.com/users/14559/shalmanese), who developed the [original script](http://stackoverflow.com/questions/18671/quick-easy-way-to-migrate-sqlite3-to-mysql/87531#87531). I merely made a few more edits and put it on GitHub for others to use and Develop, since I could find nothing to do this for free.
