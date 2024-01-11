
# apacheNifi

**Overview**

This repository contains Terraform and Ansible scripts to automate the creation of an Amazon EC2 instance and deploy Apache NiFi on it. This setup allows you to quickly and efficiently provision a vm in AWS and configure it to run Apache NiFi.

**Prereq**

Before using this repository, make sure you have the following prerequisites installed and configured:

 - Terraform 
 - Ansible (I'm running ansible via ubuntu) 
 - AWS CLI 
 - AWS Access
   Key ID and Secret Access Key with the necessary permissions to create
   EC2 instances and related resources. (I have used IAM roles in the
   terrform config to avoid hardcoding keys)

**Terraform**
Run `terraform init` to initalise the project then run the `terraform apply` command.

**Ansible**
Once this is done, you can run the ansible playbook.

Below is what I am running to execute the playbook:

    ansible-playbook -i inventory -u ec2-user -e nifi_version=2.0.0-M1 -e nifi_http_port=8080 --ask-become-pass apacheNifi.yaml

This uses Apache NiFi version 2.0.0-M1.
