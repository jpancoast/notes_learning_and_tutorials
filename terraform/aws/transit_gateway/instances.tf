data "aws_ami" "us-west-2" {
  most_recent = true
  provider    = aws.us-west-2

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "us-east-2" {
  most_recent = true
  provider    = aws.us-east-2

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "tgw_testing-us-west-2" {
  provider = aws.us-west-2

  key_name   = "tgw_testing"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCtMlCgM6Tf4WPNRKGWf+3iFrtS1RKhAlycbETBkRg6BgVDavb/9Q3Acv0FN/9CX6gogrcfLB334LOSBNU1jWuI1I9X1X/UGlKQR6CZ8mU90GwD6Qfko4gU1XV+YhcO2ziP8STdzO2KmBKPAV1nWoQCBlPR88txnsgzqKGh/5RLSGzWD4yosWDf77nulDtLf3P+zrJSrJLwSTIQ+DCTi2Kln5e12ty4rYlJk+CtMQxRDuaTCYJ3XX+0EmkxWZRoCQvn+sstngDe9GmE7FtemFLucTXhyCBsqfPiUifmHqYWsWqDk5rpoNXzDVmykWaoQPnSPxujLdKCX7WyFkLWemp+BnKhSegx1YaZXZOKNwG3l9fU1OYhv9Vfpo6rNVLENOYT3uE8bVGW/X8Rv11ffmvzbfgaDBxC9uxd/sXXbpiqRJLLRO/FdeamH7dy6MYMthO7FWINL7pImeN1b/t+hVfK4EDkVXu2EUpgWQs4U39BO+GlzKoHAKyM9JSmNkpqXiE= jpancoast@lothal.local"
}

resource "aws_key_pair" "tgw_testing-us-east-2" {
  provider = aws.us-east-2

  key_name   = "tgw_testing"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCtMlCgM6Tf4WPNRKGWf+3iFrtS1RKhAlycbETBkRg6BgVDavb/9Q3Acv0FN/9CX6gogrcfLB334LOSBNU1jWuI1I9X1X/UGlKQR6CZ8mU90GwD6Qfko4gU1XV+YhcO2ziP8STdzO2KmBKPAV1nWoQCBlPR88txnsgzqKGh/5RLSGzWD4yosWDf77nulDtLf3P+zrJSrJLwSTIQ+DCTi2Kln5e12ty4rYlJk+CtMQxRDuaTCYJ3XX+0EmkxWZRoCQvn+sstngDe9GmE7FtemFLucTXhyCBsqfPiUifmHqYWsWqDk5rpoNXzDVmykWaoQPnSPxujLdKCX7WyFkLWemp+BnKhSegx1YaZXZOKNwG3l9fU1OYhv9Vfpo6rNVLENOYT3uE8bVGW/X8Rv11ffmvzbfgaDBxC9uxd/sXXbpiqRJLLRO/FdeamH7dy6MYMthO7FWINL7pImeN1b/t+hVfK4EDkVXu2EUpgWQs4U39BO+GlzKoHAKyM9JSmNkpqXiE= jpancoast@lothal.local"
}

resource "aws_security_group" "tgw-testing-us-west-2-vpc-1" {
  provider = aws.us-west-2

  name = "tgw-testing-us-west-2-vpc-1"

  vpc_id = module.us-west-2-vpc-1.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["76.154.206.41/32", module.us-west-2-vpc-1.vpc_cidr_block, module.us-west-2-vpc-2.vpc_cidr_block, module.us-east-2-vpc-1.vpc_cidr_block, module.us-east-2-vpc-2.vpc_cidr_block]
  }

  ingress {
    description = "ping"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [module.us-west-2-vpc-1.vpc_cidr_block, module.us-west-2-vpc-2.vpc_cidr_block, module.us-east-2-vpc-1.vpc_cidr_block, module.us-east-2-vpc-2.vpc_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "tgw-testing-us-west-2-vpc-2" {
  provider = aws.us-west-2

  name = "tgw-testing-us-west-2-vpc-2"

  vpc_id = module.us-west-2-vpc-2.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["76.154.206.41/32", module.us-west-2-vpc-1.vpc_cidr_block, module.us-west-2-vpc-2.vpc_cidr_block, module.us-east-2-vpc-1.vpc_cidr_block, module.us-east-2-vpc-2.vpc_cidr_block]
  }

  ingress {
    description = "ping"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [module.us-west-2-vpc-1.vpc_cidr_block, module.us-west-2-vpc-2.vpc_cidr_block, module.us-east-2-vpc-1.vpc_cidr_block, module.us-east-2-vpc-2.vpc_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "tgw-testing-us-east-2-vpc-1" {
  provider = aws.us-east-2

  name = "tgw-testing-us-east-2-vpc-1"

  vpc_id = module.us-east-2-vpc-1.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["76.154.206.41/32", module.us-west-2-vpc-1.vpc_cidr_block, module.us-west-2-vpc-2.vpc_cidr_block, module.us-east-2-vpc-1.vpc_cidr_block, module.us-east-2-vpc-2.vpc_cidr_block]
  }

  ingress {
    description = "ping"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [module.us-west-2-vpc-1.vpc_cidr_block, module.us-west-2-vpc-2.vpc_cidr_block, module.us-east-2-vpc-1.vpc_cidr_block, module.us-east-2-vpc-2.vpc_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "tgw-testing-us-east-2-vpc-2" {
  provider = aws.us-east-2

  name = "tgw-testing-us-east-2-vpc-2"

  vpc_id = module.us-east-2-vpc-2.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["76.154.206.41/32", module.us-west-2-vpc-1.vpc_cidr_block, module.us-west-2-vpc-2.vpc_cidr_block, module.us-east-2-vpc-1.vpc_cidr_block, module.us-east-2-vpc-2.vpc_cidr_block]
  }

  ingress {
    description = "ping"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [module.us-west-2-vpc-1.vpc_cidr_block, module.us-west-2-vpc-2.vpc_cidr_block, module.us-east-2-vpc-1.vpc_cidr_block, module.us-east-2-vpc-2.vpc_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "test-tgw-us-west-2-vpc-1-public" {
  provider = aws.us-west-2

  ami                         = data.aws_ami.us-west-2.id
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.tgw_testing-us-west-2.key_name
  subnet_id                   = module.us-west-2-vpc-1.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.tgw-testing-us-west-2-vpc-1.id]

  tags = {
    Name = "test-tgw-us-west-2-public"
  }
}

resource "aws_instance" "test-tgw-us-west-2-vpc-1-private" {
  provider = aws.us-west-2

  ami                    = data.aws_ami.us-west-2.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.tgw_testing-us-west-2.key_name
  subnet_id              = module.us-west-2-vpc-1.private_subnets[0]
  vpc_security_group_ids = [aws_security_group.tgw-testing-us-west-2-vpc-1.id]

  tags = {
    Name = "test-tgw-us-west-2-private"
  }
}

resource "aws_instance" "test-tgw-us-west-2-vpc-2-private" {
  provider = aws.us-west-2

  ami                    = data.aws_ami.us-west-2.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.tgw_testing-us-west-2.key_name
  subnet_id              = module.us-west-2-vpc-2.private_subnets[0]
  vpc_security_group_ids = [aws_security_group.tgw-testing-us-west-2-vpc-2.id]

  tags = {
    Name = "test-tgw-us-west-2-private"
  }
}

resource "aws_instance" "test-tgw-us-east-2-vpc-1-public" {
  provider = aws.us-east-2

  ami                         = data.aws_ami.us-east-2.id
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.tgw_testing-us-east-2.key_name
  subnet_id                   = module.us-east-2-vpc-1.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.tgw-testing-us-east-2-vpc-1.id]

  tags = {
    Name = "test-tgw-us-east-2-public"
  }
}

resource "aws_instance" "test-tgw-us-east-2-vpc-1-private" {
  provider = aws.us-east-2

  ami                    = data.aws_ami.us-east-2.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.tgw_testing-us-east-2.key_name
  subnet_id              = module.us-east-2-vpc-1.private_subnets[0]
  vpc_security_group_ids = [aws_security_group.tgw-testing-us-east-2-vpc-1.id]

  tags = {
    Name = "test-tgw-us-east-2-private"
  }
}

resource "aws_instance" "test-tgw-us-east-2-vpc-2-private" {
  provider = aws.us-east-2

  ami                    = data.aws_ami.us-east-2.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.tgw_testing-us-east-2.key_name
  subnet_id              = module.us-east-2-vpc-2.private_subnets[0]
  vpc_security_group_ids = [aws_security_group.tgw-testing-us-east-2-vpc-2.id]

  tags = {
    Name = "test-tgw-us-east-2-private"
  }
}

output "us-east-2-ips" {
  value = {
    vpc-1-public  = aws_instance.test-tgw-us-east-2-vpc-1-public.public_ip,
    vpc-1-private = aws_instance.test-tgw-us-east-2-vpc-1-private.private_ip,
    vpc-2-private = aws_instance.test-tgw-us-east-2-vpc-2-private.private_ip
  }
}

output "us-west-2-ips" {
  value = {
    vpc-1-public  = aws_instance.test-tgw-us-west-2-vpc-1-public.public_ip,
    vpc-1-private = aws_instance.test-tgw-us-west-2-vpc-1-private.private_ip,
    vpc-2-private = aws_instance.test-tgw-us-west-2-vpc-2-private.private_ip
  }
}
