#!/bin/bash

# package updates
sudo yum check-update
sudo yum update -y

# apache installation, enabling
sudo yum -y install httpd
sudo systemctl start httpd
sudo systemctl enable httpd

# firewall installation, start
sudo yum install firewalld
sudo systemctl start firewalld

# adding http and https services
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https

# reloading the firewall
sudo firewall-cmd --reload

# adding the needed permissions for creating and editing the index.html file
sudo chown -R $USER:$USER /var/www

# creating the html landing page
cd /var/www/html/
echo '<!DOCTYPE html>' > index.html
echo '<html>' >> index.html
echo '<head>' >> index.html
echo '<meta charset="UTF-8">' >> index.html
echo '</head>' >> index.html
echo '<body>' >> index.html
echo '<h1>Welcome Page</h1>' >> index.html
echo '</body>' >> index.html
echo '</html>' >> index.html