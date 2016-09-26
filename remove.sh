#!/bin/bash

/etc/init.d/php5-fpm stop
rm -r /usr/local/php5
update-rc.d php5-fpm remove
rm /etc/init.d/php5-fpm
