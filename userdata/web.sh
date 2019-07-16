#### This script is used to install git,ansible and then set the hostname
#### As this is a web node we are applying the httpd playbook
#### This will also clone the code and playbooks from git and execute during the instance startup
#### Here we are using a master less ansible as this satisfies the requirement
#### For adhoc deployments and pull code we can set a scheduled cron to pull code or setup a ansible master and create a playbook accordingly

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
