#!/bin/bash
dnf install httpd -y
systemctl enable httpd
systemctl start httpd
echo "<h1>AWS 3-Tier Infrastructure Automation with Terraform</h1>" > /var/www/html/index.html
