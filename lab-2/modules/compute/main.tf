data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "server" {
  for_each = var.subnet_ids

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  subnet_id              = each.value
  vpc_security_group_ids = [var.sg_id]

  tags = { Name = "Server-${each.key}" }

  provisioner "local-exec" {
    command = "echo 'EC2 created in VPC: ${var.vpc_id}'"
  }
}