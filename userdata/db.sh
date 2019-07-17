#!/bin/bash
sudo yum install git -y
cd /home/ec2-user/
sudo git clone https://github.com/sgoparapu/ansible-tw.git
sudo hostnamectl set-hostname db.tw
sudo amazon-linux-extras install ansible2
sudo cd /home/ec2-user/ansible-tw
sudo ansible-playbook -l localhost /home/ec2-user/ansible-tw/mysql.yml
