#!/bin/bash
cd "$(dirname "$0")"

/usr/local/php5/bin/pecl -C /usr/local/php5/etc/pear.conf install apcu-4.0.11

# Add config files
echo "extension=apcu.so" | sudo tee -a /usr/local/php5/etc/conf.d/modules.ini
