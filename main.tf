provider "aws"{
    region = "ap-south-2"
}
resource "aws_instance" "example" {
    ami = "ami-07dedf684cf9b4a16"
    instance_type = "t3.micro"
    key_name  = "Keypair"
    tags = {
     "Name" = "my_EC2"
     }
     count = 4
     user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install httpd -y
                systemctl start httpd
                systemctl enable httpd
                EOF
    }
    