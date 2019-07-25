How to Run the code :

Make sure that variables.tf is updated with the right values for now i have given some default values

First run the "sh generate_mysql_user_and" to generate the DB credentials and make a note of what you are giving as we need them later
Secondly run "terraform apply"
Third Clear the DB credentials by "sh clear_credentials.sh"
Fourth get the browser put the DNS of load balancer and try to follow the onscreen instructions

This repo contains below set of files and Directories 

alb.tf  -- This Terraform script is used setup Application Load Balancer and related stuff like adding target group listeners etc
web.tf -- This Terraform script is used setup web instance and related stuff
db.tf  -- This Terraform script is used setup DB instance and related stuff
main.tf -- This is the main pillar which ideally takes care of creating a VPC Subnet and various other components which gives us platform to setup or instances
providers.tf  -- In this demo i am using AWS so you can choose accordingly
generate_mysql_user_and - To generate DB credentials for Mediawiki App
clear_credentials.sh - To remove the traces of the credentials
variables.tf  -- Information related to providers like access key and all are updated here
sidharth.pem  -- This is the demo key that is used if you want to use a different key you can create a new one and update the web.tf and db.tf accordingly
userdata  -- This contains the Startup scripts for the instances at the time of launch

The other important thing is the below repo which has a demo page and ansible code which is being called during the instance startup

https://github.com/sgoparapu/ansible-tw.git

In this demo we are going with a master less ansible as we are not doing much with the ansible host if we want we can setup a master as well.

