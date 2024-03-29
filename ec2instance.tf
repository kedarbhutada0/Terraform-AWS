#AWS EC2 Instance
resource "aws_instance" "dev_node" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.server_ami.id
  key_name               = aws_key_pair.poc_auth.id
  vpc_security_group_ids = [aws_security_group.poc_sg.id]
  subnet_id              = aws_subnet.poc_public_subnet.id
  user_data              = file("userdata.tpl")

  root_block_device {
    volume_size = 10
  }

  tags = {
    Name = "dev-node"
  }

  provisioner "local-exec" {
    command = templatefile("${var.host_os}-ssh-config.tpl", {
      hostname     = self.public_ip,
      user         = "ubuntu",
      identityfile = "~/.ssh/pockey"
    })
    interpreter = ["Powershell", "-Command"]
  }
}

resource "aws_instance" "dev_node_2" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.server_ami.id
  key_name               = aws_key_pair.poc_auth.id
  vpc_security_group_ids = [aws_security_group.poc_sg.id]
  subnet_id              = aws_subnet.poc_public_subnet.id
  user_data              = file("userdata.tpl")

  root_block_device {
    volume_size = 10
  }

  tags = {
    Name = "dev-node-2"
  }

  provisioner "local-exec" {
    command = templatefile("${var.host_os}-ssh-config.tpl", {
      hostname     = self.public_ip,
      user         = "ubuntu",
      identityfile = "~/.ssh/pockey"
    })
    interpreter = ["Powershell", "-Command"]
  }
}

resource "aws_instance" "dev_node_3" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.server_ami.id
  key_name               = aws_key_pair.poc_auth.id
  vpc_security_group_ids = [aws_security_group.poc_sg.id]
  subnet_id              = aws_subnet.poc_public_subnet.id
  user_data              = file("userdata-3.tpl")

  root_block_device {
    volume_size = 10
  }

  tags = {
    Name = "dev-node-3"
  }

  provisioner "local-exec" {
    command = templatefile("${var.host_os}-ssh-config.tpl", {
      hostname     = self.public_ip,
      user         = "ubuntu",
      identityfile = "~/.ssh/pockey"
    })
    interpreter = ["Powershell", "-Command"]
  }
}

resource "aws_instance" "dev_node_4" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.server_ami.id
  key_name               = aws_key_pair.poc_auth.id
  vpc_security_group_ids = [aws_security_group.poc_sg.id]
  subnet_id              = aws_subnet.poc_public_subnet.id
  user_data              = file("userdata-3.sh")

  root_block_device {
    volume_size = 10
  }

  tags = {
    Name = "dev-node-4"
  }

  provisioner "local-exec" {
    command = templatefile("${var.host_os}-ssh-config.tpl", {
      hostname     = self.public_ip,
      user         = "ubuntu",
      identityfile = "~/.ssh/pockey"
    })
    interpreter = ["Powershell", "-Command"]
  }
}