#! /bin/bash
sudo apt update -y
sudo apt install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "Hello world, from apache tomcat" | sudo tee /var/www/html/index.html
#install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo service docker start
#install apache-exporter
docker run -d -p 9117:9117 bitnami/apache-exporter:latest
#install custom prometheus docker with apache exporter configured
docker run -itd -p 9090:9090 kamanda/prometheus:apache.prom.v1