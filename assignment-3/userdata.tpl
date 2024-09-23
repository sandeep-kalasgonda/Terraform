#!/bin/bash
#Commands to install nginx, git and host the static website
sudo yum update -y &&
sudo amazon-linux-extras install nginx1 -y
sudo service nginx start

sudo yum install -y git

cd /home/ec2-user
git clone https://github.com/raghuck/food-menu-staticwebsite.git
sudo cp /home/ec2-user/food-menu-staticwebsite/* /usr/share/nginx/html/