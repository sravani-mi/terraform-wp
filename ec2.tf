provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA3FLD46TKRYVZVZXQ"
  secret_key = "Prm9BJrCOuTM+SloOvrMuKkuyz8497scti9XHWbZ"
}

# Specify your existing security group ID
variable "security_group_id" {
  description = "The ID of the existing security group"
  type        = string
  default     = "sg-0d5717c258c22cd62"
  # Replace with your actual security group ID
}
# Create an EC2 instance
resource "aws_instance" "my_ec2_instance" {
  ami                         = "ami-0e54eba7c51c234f6" #Replace with a valid AMI ID #ami architecture should match with ami type architecture
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  user_data                   = file("userdata.sh")

  tags = {
    Name = "wordpress"
  }
}

