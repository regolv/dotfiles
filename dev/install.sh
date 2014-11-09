#!/bin/sh

# Make sure that is executed as sudo
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Allows to get to vagrant sites without 8000 port
cat > /etc/apache2/other/homestead.conf <<EOL
<VirtualHost *:80>
    ProxyPreserveHost On
    ProxyRequests Off
    ProxyPass / http://localhost:8000/
    ProxyPassReverse / http://localhost:8000/
</VirtualHost>
EOL

# Set up Homestead
vagrant box add laravel/homestead
git clone https://github.com/laravel/homestead.git ~/Homestead