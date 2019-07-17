db.sh

#### This script is used to install git,ansible and then set the hostname
#### This will also clone the code and playbooks from git and execute during the instance startup
#### Here we are applying the mysql playbook
#### Here we are using a master less ansible as this satisfies the requirement
#### For adhoc deployments and pull code we can set a scheduled cron to pull code or setup a ansible master and create a playbook accordingly

web.sh

#### This script is used to install git,ansible and then set the hostname
#### As this is a web node we are applying the httpd playbook
#### This will also clone the code and playbooks from git and execute during the instance startup
#### Here we are using a master less ansible as this satisfies the requirement
#### For adhoc deployments and pull code we can set a scheduled cron to pull code or setup a ansible master and create a playbook accordingly
