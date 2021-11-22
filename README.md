Execution plan

1. This execution plan assumes you have terraform installed, otherwise pause and install Terraform, https://www.terraform.io/
 
2. Create a working directory, on your desktop, name it ‘terraform’; you can give any name.
 
3. Create a free aws account, create user, generate key pair, access key and secrete key to use later, make sure to download the .pem key pair to your preferred directory. 
 
4. Look up for your closest aws region and your prefered ami, copy aim id somewhere to use later. For this project, the commands used works well with Ubuntu Server 20.04 LTS (64-bit Arm). I prefer you use the same in order to achieve the desired results, ami is region specific.
 
5. Clone repo to your working folder

6. From your terminal, cd into your working directory
 
7. Run commands:
- terraform init 
- terraform validate
- terraform plan
- terraform apply
Enter values whenever prompted. copy the outputs from public ip and DNS address to use it later.
You all set provisioning your ec2 instance
 
8. Now go to your browser and enter public_IP:9090
You can navigate through and view the metrics from your server
