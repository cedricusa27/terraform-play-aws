#This resource will create a security group that will allow HTTP 80 & SSH 22
resource "aws_security_group" "terrawebsg" {
  name        = "Terra-web-sg"
  description = "Allow http,ssh"
  vpc_id      =  aws_vpc.testvpc.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks =  ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "Terrawebsg"
  }
}




 


