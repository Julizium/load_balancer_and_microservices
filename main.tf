module "vpc" {
  source = "./modules/vpc"

  vpc_name           = "ce_smart_home_vpc"
  cidr_range         = "10.0.0.0/20"
  availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  public_subnets     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.8.0/24", "10.0.9.0/24", "10.0.10.0/24"]
}

module "security_groups" {
  source = "./modules/security_groups"

  vpc_id = module.vpc.vpc_id
}

module "ec2_instances" {
  source = "./modules/ec2_instances"

  subnet_id     = module.vpc.public_subnets
  security_group_ids = [module.security_groups.security_group_id]
}

module "target_groups" {
  source = "./modules/target_groups"

  security_group_ids = [module.security_groups.security_group_id]
  vpc_id = module.vpc.vpc_id
  target_id =  module.ec2_instances.aws_instance_ids

  
}

# module "load_balancer" {
#  source = "./modules/load_balancer"
#
#  security_groups    = [module.security_groups.security_group_id]
#  subnets            = module.vpc.public_subnets
#  target_group_arn = module.target_groups.heating.arn
# }