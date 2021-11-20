Execution plan
Step 1. 
This execution plan assumes you have terraform installed, otherwise pause and install Terraform, https://www.terraform.io/
Step 2. 
Create a working directory, on your desktop, name it ‘terraform’; you can give any name.
Step 3. 
Create a free aws account, create user, generate access key and secrete key to use later, make sure to download the .pem key to your preferred directory. 
Step 4. 
Look up for your closest aws region and your prefered ami, copy aim id somewhere to use later. For this project, the commands used works well with ubuntu flavor. I prefer you use the same in order to achieve the desired results, ami is region specific.
Step 5. 
Clone repo to your working folder
Step 6. 
From your terminal, cd into your working directory
Step 7. 
Terraform init, validate, terraform plan and terraform apply
Enter values whenever prompted. copy the outputs from public ip and DNS address to use it later.
Note: we will be copying the custom Prometheus.yml file included in this project to our ec2 instance /opt/ directory by running the command bellow. This file has a reference to our Prometheus exporter that is already deployed in your ec2 instance that we created above. We will mount a reference to this file when we run Prometheus docker to monitor our server.
You all set provisioning your ec2 instance
Step 8. 
From your terminal, run the following command to copy your Prometheus.yml file in this project to your /opt/ directory of your instance
	scp -i ~/your/path/to/your-key.pem -r ~/path/to/your/working/directory/prometheus.yml your_ec2_user@your_dns_address:~/opt/

Step 9. 
Now ssh into your instance and run the following command to deploy Prometheus docker to monitor your instance. Already docker is installed while provisioning the ec2 instance.
   docker run -p 9090:9090 prom/prometheus

Now go to your browser and enter public_IP:Prometheus_port
You can navigate through and view the metrics from your server
