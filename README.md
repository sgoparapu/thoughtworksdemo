To run the setup

Just clone the repo and cd to the directory and

> Update the variables.tf with the corresponding values

> Then generate DB credentials for Mediawiki Application by running 
   sh generate_mysql_user_and 
   
> Get to the location where tf files are and perform the terraform apply
    terraform apply
    
> Clear the DB credentials
   sh clear_credentials.sh


Test by putting the DNS of the Load balancer in the browser ideally you should see a webpage being displayed

Follow the onscreen instructions to setup Application

--------------------------------------------------------------------------------------------------

This repo contains below set of files and Directories 

alb.tf  -- This Terraform script is used setup Application Load Balancer and related stuff like adding target group listeners etc

web.tf -- This Terraform script is used setup web instance and related stuff

db.tf  -- This Terraform script is used setup DB instance and related stuff

main.tf -- This is the main pillar which ideally takes care of creating a VPC Subnet and various other components which gives us platform to setup or instances

providers.tf  -- In this demo i am using AWS so you can choose accordingly

variables.tf  -- Information related to providers like access key and all are updated here

generate_mysql_user_and - To generate DB credentials for Mediawiki App

clear_credentials.sh - To remove the traces of the credentials

userdata  -- This contains the Startup scripts for the instances at the time of launch

The other important thing is the below repo which has a demo page and ansible code which is being called during the instance startup

https://github.com/sgoparapu/ansible-tw.git

In this demo we are going with a master less ansible as we are not doing much with the ansible host if we want we can setup a master as well.

