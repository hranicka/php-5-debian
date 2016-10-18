#!/bin/bash
cd "$(dirname "$0")"

# Create a dir for storing PHP module conf
mkdir /usr/local/php5/etc/conf.d
mkdir /usr/local/php5/etc/php-fpm.d

# Symlink php-fpm to php5-fpm
ln -s /usr/local/php5/sbin/php-fpm /usr/local/php5/sbin/php5-fpm

# Install PECL
/usr/local/php5/bin/pecl -C /usr/local/php5/etc/pear.conf install apcu-4.0.11
/usr/local/php5/bin/pecl -C /usr/local/php5/etc/pear.conf install ssh2-0.13

# Add config files
cp php-src/php.ini-production /usr/local/php5/lib/php.ini
cp conf/www.conf /usr/local/php5/etc/php-fpm.d/www.conf
cp conf/php-fpm.conf /usr/local/php5/etc/php-fpm.conf
cp conf/modules.ini /usr/local/php5/etc/conf.d/modules.ini

# Add the init script
cp conf/php5-fpm.init /etc/init.d/php5-fpm
chmod +x /etc/init.d/php5-fpm
update-rc.d php5-fpm defaults

service php5-fpm start
