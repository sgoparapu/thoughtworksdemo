#!/bin/bash
sudo yum install git -y
cd /home/ec2-user/
sudo git clone https://github.com/sgoparapu/ansible-tw.git
sudo hostnamectl set-hostname web.tw
sudo amazon-linux-extras install ansible2
sudo yum install php* -y
sudo cd /home/ec2-user/ansible-tw
sudo ansible-playbook -l localhost /home/ec2-user/ansible-tw/httpd.yml
cd /tmp
sudo wget https://releases.wikimedia.org/mediawiki/1.26/mediawiki-core-1.26.4.tar.gz
sudo tar -xvzf mediawiki-core-1.26.4.tar.gz
sudo cp -rvf mediawiki-1.26.4/* /var/www/html/
