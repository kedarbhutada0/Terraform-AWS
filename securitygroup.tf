#AWS Security Group
resource "aws_security_group" "poc_sg" {
  name        = "dev_sg"
  description = "Dev Security Group"
  vpc_id      = aws_vpc.poc_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["49.36.56.193/32"] //Add your ipv4 address here
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}