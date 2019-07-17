#!/bin/bash
sudo yum install git -y
cd /home/ec2-user/
sudo git clone https://github.com/sgoparapu/ansible-tw.git
sudo hostnamectl set-hostname web.tw
sudo amazon-linux-extras install ansible2
sudo cd /home/ec2-user/ansible-tw
sudo ansible-playbook -l localhost /home/ec2-user/ansible-tw/httpd.yml
sudo cp /home/ec2-user/ansible-tw/index.html /var/www/html/
sudo cp /home/ec2-user/ansible-tw/thoughtwork.jpg /var/www/html/
