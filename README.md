# WAAP-TF-AWS
### Automatically Deploy WAAP and Vulnerable Web App
Written by Michael Braun


This playbook will install Nginx and Docker on a Ubuntu VM within AWS. 

It will then download [OWASP Juice Shop](https://github.com/bkimminich/juice-shop) and run as a container.

Finally, it will deploy the WAAP and register it.

This was built for and tested on [Terraform Cloud](https://terraform.io)

