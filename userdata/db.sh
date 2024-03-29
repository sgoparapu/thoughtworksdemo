#!/bin/bash
sudo yum install git -y
cd /home/ec2-user/
sudo git clone https://github.com/sgoparapu/ansible-tw.git
sudo hostnamectl set-hostname db.tw
sudo amazon-linux-extras install ansible2
cd /home/ec2-user/ansible-tw
sudo ansible-playbook -l localhost /home/ec2-user/ansible-tw/mysql.yml
sudo mysql -e "CREATE DATABASE tworks"
sudo mysql -e "CREATE USER 'tworks'@'%' IDENTIFIED BY 'tworks123'"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'tworks'@'%' IDENTIFIED BY 'tworks123'"
