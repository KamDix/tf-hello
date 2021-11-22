Execution plan
Step 1. 
This execution plan assumes you have terraform installed, otherwise pause and install Terraform, https://www.terraform.io/
Step 2. 
Create a working directory, on your desktop, name it ‘terraform’; you can give any name.
Step 3. 
Create a free aws account, create user, generate key pair, access key and secrete key to use later, make sure to download the .pem key pair to your preferred directory. 
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
Now ssh into your instance using your key pair and dns address or public IP address of your instance. Already docker is installed while terraform was provisioning aws ec2 instance. The file we are mounting here has a target ip address for our exporter. It makes it posible to collect the metrics.
- first cd to /opt/ and create a file called promethus.yml
- copy the contents of the prometheus.yml file included in this project and paste it there. Next is to run the command and mount the file:
   docker run -d --name prometheus-container -p 9090:9090 -v /opt/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus

Now go to your browser and enter public_IP:9090
You can navigate through and view the metrics from your server
***** alternatively you can create a custom prometheus image with the file you created and build a new image that can run to deploy prometheus docker container with your predefined targets*****
