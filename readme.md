# Install PHP 5 on Debian/Ubuntu

These are a set of bash scripts for building and running PHP 5 (CLI and FPM) on Debian based Linux distributions:

- `build.sh` installs the necessary build dependencies and the latest development version of PHP with CLI and FPM server APIs (SAPI) from the latest PHP 5 branch of https://github.com/php/php-src

- `install.sh` sets up PHP-FPM by moving configuration files into their correct locations in `/usr/local/php5` and enables the `php5-fpm` service and adds it to the startup sequence.

Please note that these are very simple scripts that don't implement error checking or process validation.

## Usage

	cd /tmp
	git clone https://github.com/hranicka/php-5-debian.git
	cd php-5-debian
	./build.sh

### Install

	sudo ./install.sh

### Update only

	sudo ./update.sh

## About installation

The PHP-FPM can be operated using the `php5-fpm` init script:

	Usage: /etc/init.d/php5-fpm {start|stop|status|restart|reload|force-reload}

While the FPM socket is available at:

	127.0.0.1:9006

Executables (also CLI) are located at:

	/usr/local/php5/bin/php
	/usr/bin/php5

## Configuration files

All PHP configuration files are stored under `/usr/local/php5`:

	/usr/local/php5/lib/php.ini
	/usr/local/php5/etc/php-fpm.conf
	/usr/local/php5/etc/php-fpm.d/www.conf
	/usr/local/php5/etc/conf.d/modules.ini

while the Debian init script is added to:

	/etc/init.d/php5-fpm

## Extensions

Here is a list of PHP modules that are enabled by default in this build:

	$ /usr/local/php5/bin/php -m
	[PHP Modules]
	bcmath
	bz2
	calendar
	Core
	ctype
	curl
	date
	dba
	dom
	exif
	fileinfo
	filter
	ftp
	gd
	gettext
	hash
	iconv
	intl
	json
	libxml
	mbstring
	mcrypt
	mhash
	mysqli
	mysqlnd
	openssl
	pcntl
	pcre
	PDO
	pdo_mysql
	pdo_sqlite
	Phar
	posix
	pspell
	readline
	Reflection
	session
	shmop
	SimpleXML
	soap
	sockets
	SPL
	sqlite3
	standard
	sysvmsg
	sysvsem
	sysvshm
	tokenizer
	wddx
	xml
	xmlreader
	xmlwriter
	Zend OPcache
	zip
	zlib

	[Zend Modules]
	Zend OPcache

## Installing Extensions

There are some extensions in `extension` directory.

You can install them simply with given scripts.

For example Memcached extension:

	cd php-5-debian/extensions
	./memcached-build.sh
	sudo ./memcached-install.sh

After installation there is need to restart some services (fpm).

You can done it simply with another script:

	cd ..
	sudo ./update.sh

## Credits

- Created by [Jaroslav Hranička](https://hranicka.cz)
- Based on [Kaspars Dambis](https://github.com/kasparsd/php-7-debian)
- Based on [Piotr Plenik](https://github.com/jupeter)
- Based on [`php7.sh`](https://gist.github.com/tvlooy/953a7c0658e70b573ab4) by [Tom Van Looy](http://www.intracto.com/nl/blog/running-symfony2-on-php7)
