#!/bin/bash
cd "$(dirname "$0")"

/usr/local/php5/bin/pecl -C /usr/local/php5/etc/pear.conf install ssh2-0.13

# Add config files
echo "extension=ssh2.so" | sudo tee -a /usr/local/php5/etc/conf.d/modules.ini
