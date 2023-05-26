
module "us-west-2-tgw" {
  source  = "terraform-aws-modules/transit-gateway/aws"
  version = "~> 2.0"

  providers = {
    aws = aws.us-west-2
  }

  name        = "us-west-2-tgw"
  description = "us-west-2-tgw"

  enable_dns_support = true

  tags = {
    Terraform = "true"
    Owner     = "jpancoast@petabloc.com"
    Purpose   = "Transit Gateway Testing"
  }


  ram_allow_external_principals = true
  ram_principals                = [577660233792]

  vpc_attachments = {
    vpc_1 = {
      vpc_id      = module.us-west-2-vpc-1.vpc_id
      subnet_ids  = module.us-west-2-vpc-1.private_subnets
      dns_support = true

      tgw_routes = [
        {
          destination_cidr_block = module.us-west-2-vpc-2.vpc_cidr_block
        },
        {
          destination_cidr_block = module.us-east-2-vpc-1.vpc_cidr_block
        },
        {
          destination_cidr_block = module.us-east-2-vpc-2.vpc_cidr_block
        }
      ]
    }

    vpc_2 = {
      vpc_id      = module.us-west-2-vpc-2.vpc_id
      subnet_ids  = module.us-west-2-vpc-2.private_subnets
      dns_support = true

      tgw_routes = [
        {
          destination_cidr_block = module.us-west-2-vpc-1.vpc_cidr_block
        }
      ]
    }
  }
}


module "us-east-2-tgw" {
  source  = "terraform-aws-modules/transit-gateway/aws"
  version = "~> 2.0"

  providers = {
    aws = aws.us-east-2
  }

  name        = "us-east-2-tgw"
  description = "us-east-2-tgw"

  enable_dns_support = true

  tags = {
    Terraform = "true"
    Owner     = "jpancoast@petabloc.com"
    Purpose   = "Transit Gateway Testing"
  }


  ram_allow_external_principals = true
  ram_principals                = [577660233792]

  vpc_attachments = {
    vpc_1 = {
      vpc_id      = module.us-east-2-vpc-1.vpc_id
      subnet_ids  = module.us-east-2-vpc-1.private_subnets
      dns_support = true

      tgw_routes = [
        {
          destination_cidr_block = module.us-east-2-vpc-2.vpc_cidr_block
        },
        {
          destination_cidr_block = module.us-west-2-vpc-1.vpc_cidr_block
        },
        {
          destination_cidr_block = module.us-west-2-vpc-2.vpc_cidr_block
        }
      ]
    }

    vpc_2 = {
      vpc_id      = module.us-east-2-vpc-2.vpc_id
      subnet_ids  = module.us-east-2-vpc-2.private_subnets
      dns_support = true

      tgw_routes = [
        {
          destination_cidr_block = module.us-east-2-vpc-1.vpc_cidr_block
        }
      ]
    }
  }
}
