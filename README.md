This repo contains below set of files and Directories 

alb.tf  -- This Terraform script is used setup Application Load Balancer and related stuff like adding target group listeners etc

web.tf -- This Terraform script is used setup web instance and related stuff

db.tf  -- This Terraform script is used setup DB instance and related stuff

main.tf -- This is the main pillar which ideally takes care of creating a VPC Subnet and various other components which gives us platform to setup or instances

providers.tf  -- In this demo i am using AWS so you can choose accordingly

variables.tf  -- Information related to providers like access key and all are updated here

sidharth.pem  -- This is the demo key that is used if you want to use a different key you can create a new one and update the web.tf and db.tf accordingly

userdata  -- This contains the Startup scripts for the instances at the time of launch

The other important thing is the below repo which has a demo page and ansible code which is being called during the instance startup

https://github.com/sgoparapu/ansible-tw.git

As I do not have any code i am just demoing with a simple html page if we have code we can customise accordingly

In this demo we are going with a master less ansible as we are not doing much with the ansible host if we want we can setup a master as well.

