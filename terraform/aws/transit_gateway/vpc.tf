#
#   us-west-2 VPC's
#

#tfsec:ignore:aws-ec2-require-vpc-flow-logs-for-all-vpcs
module "us-west-2-vpc-1" {
  providers = {
    aws = aws.us-west-2
  }

  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

  name = "us-west-2-vpc-1"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-2a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.2.0/24"]

  tags = {
    Terraform = "true"
    Owner     = "jpancoast@petabloc.com"
    Purpose   = "Transit Gateway Testing"
  }
}

#tfsec:ignore:aws-ec2-require-vpc-flow-logs-for-all-vpcs
module "us-west-2-vpc-2" {
  providers = {
    aws = aws.us-west-2
  }

  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

  name = "us-west-2-vpc-2"
  cidr = "10.1.0.0/16"

  azs             = ["us-west-2a"]
  private_subnets = ["10.1.1.0/24"]
  public_subnets  = ["10.1.2.0/24"]

  tags = {
    Terraform = "true"
    Owner     = "jpancoast@petabloc.com"
    Purpose   = "Transit Gateway Testing"
  }
}

#
#   us-east-2 VPC's
#

#tfsec:ignore:aws-ec2-require-vpc-flow-logs-for-all-vpcs
module "us-east-2-vpc-1" {
  providers = {
    aws = aws.us-east-2
  }

  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

  name = "us-east-2-vpc-1"
  cidr = "10.3.0.0/16"

  azs             = ["us-east-2a"]
  private_subnets = ["10.3.1.0/24"]
  public_subnets  = ["10.3.2.0/24"]

  tags = {
    Terraform = "true"
    Owner     = "jpancoast@petabloc.com"
    Purpose   = "Transit Gateway Testing"
  }
}

#tfsec:ignore:aws-ec2-require-vpc-flow-logs-for-all-vpcs
module "us-east-2-vpc-2" {
  providers = {
    aws = aws.us-east-2
  }

  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

  name = "us-east-2-vpc-2"
  cidr = "10.4.0.0/16"

  azs             = ["us-east-2a"]
  private_subnets = ["10.4.1.0/24"]
  public_subnets  = ["10.4.2.0/24"]

  tags = {
    Terraform = "true"
    Owner     = "jpancoast@petabloc.com"
    Purpose   = "Transit Gateway Testing"
  }
}
