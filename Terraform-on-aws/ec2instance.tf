# Create EC2 instance in the pub 
resource "aws_instance" "web_server" {
   ami                    = data.aws_ami.amazon-linux.id
   instance_type          = var.Instance_type
   key_name               = var.Instance_key_pair
   security_groups        = [ aws_security_group.terrawebsg.id ]
   associate_public_ip_address = true
   subnet_id              = aws_subnet.public-subnet-1.id
 }

# Create EC2 instance in priv
resource "aws_instance" "private_server" {
   ami                    = data.aws_ami.amazon-linux.id
   instance_type          = var.Instance_type
   key_name               = var.Instance_key_pair
   security_groups        = [ aws_security_group.terrawebsg.id ]
   subnet_id              = aws_subnet.private-subnet-1.id
}