terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}
resource "aws_instance" "ec2_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_pair
  security_groups        = ["${aws_security_group.ec2_sg.name}"]
  vpc_security_group_ids = ["${aws_security_group.ec2_sg.id}"]
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  //install nginx in your instance
  user_data = "${file("install-apache.sh")}"
  tags = {
    Name = "${var.enviroment}-Server"
  }
}
resource "aws_security_group" "ec2_sg" {
  name        = "${var.enviroment}-ec2-security-group"
  description = "allow web access"
  ingress {
    description = "allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow http to access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "http access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "http prometheus access"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description      = "allow all outbound internet access "
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "ec2-security-group"
  }
}
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.enviroment}-ec2-profile"
  role = aws_iam_role.ec2_role.name
}
resource "aws_iam_role" "ec2_role" {
  name = "${var.enviroment}-ec2-role-new"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}
