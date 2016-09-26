#!/bin/bash

# Add config files
echo "extension=imagick.so" | sudo tee -a /usr/local/php5/etc/conf.d/modules.ini
