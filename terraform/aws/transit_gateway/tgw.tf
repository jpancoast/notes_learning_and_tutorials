
module "us-west-2-tgw" {
  source  = "terraform-aws-modules/transit-gateway/aws"
  version = "~> 2.0"

  name        = "us-west-2-tgw"
  description = "us-west-2-tgw"

  enable_auto_accept_shared_attachments = true

  tags = {
    Terraform = "true"
    Owner     = "jpancoast@petabloc.com"
    Purpose   = "Transit Gateway Testing"
  }

  vpc_attachments = {
    vpc_1 = {
      vpc_id      = module.us-west-2-vpc-1.vpc_id
      subnet_ids  = module.us-west-2-vpc-1.private_subnets
      dns_support = true

      tgw_routes = []
    }

    vpc_2 = {
      vpc_id      = module.us-west-2-vpc-2.vpc_id
      subnet_ids  = module.us-west-2-vpc-2.private_subnets
      dns_support = true

      tgw_routes = []
    }
  }
}
