provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

#------------IAM----------------

module "iam" {
  source = "./iam"
}

#------------- VPC -----------

module "vpc" {
  source                   = "./vpc"
  aws_region               = "${var.aws_region}"
  cidrs                    = "${var.cidrs}"
  domain_name              = "${var.domain_name}"
  localip                  = "${var.localip}"
  vpc_cidr                 = "${var.vpc_cidr}"
  availability_zones_names = "${data.aws_availability_zones.available.names}"
}

#--------- Compute -----------

module "compute" {
  source                  = "./compute"
  asg_cap                 = "${var.asg_cap}"
  asg_grace               = "${var.asg_grace}"
  asg_hct                 = "${var.asg_hct}"
  asg_max                 = "${var.asg_max}"
  asg_min                 = "${var.asg_min}"
  db_instance_class       = "${var.db_instance_class}"
  dbname                  = "${var.dbname}"
  dbpassword              = "${var.dbpassword}"
  dbuser                  = "${var.dbuser}"
  dev_ami                 = "${var.dev_ami}"
  dev_instance_type       = "${var.dev_instance_type}"
  domain_name             = "${var.domain_name}"
  elb_healthy_threshold   = "${var.elb_healthy_threshold}"
  elb_interval            = "${var.elb_interval}"
  elb_timeout             = "${var.elb_timeout}"
  elb_unhealthy_threshold = "${var.elb_healthy_threshold}"
  key_name                = "${var.key_name}"
  lc_instance_type        = "${var.lc_instance_type}"
  public_key_path         = "${var.public_key_path}"
  db_subnet_group_name    = "${module.vpc.wp_rds_subnetgroup_name}"
  iam_instance_profile    = "${module.iam.s3_access_profile_id}"
  aws_instance_subnet_id  = "${module.vpc.public_subnets[0]}"
  bucket                  = "${module.vpc.bucketname}"
  public_subnets          = "${module.vpc.public_subnets}"
  private_subnets         = "${module.vpc.private_subnets}"
  dev_sg                  = "${module.vpc.wp_dev_sg_id}"
  private_sg              = "${module.vpc.wp_private_sg_id}"
  public_sg               = "${module.vpc.wp_public_sg_id}"
  rds_sg                  = "${module.vpc.wp_rds_sg_id}"
}

#--------- Route53 -------------

module "route53" {
  source           = "./route53"
  delegation_set   = "${var.delegation_set}"
  domain_name      = "${var.domain_name}"
  elb_dns          = "${module.compute.elb_dnsname}"
  elb_zone_id      = "${module.compute.elb_zoneid}"
  db_ip            = "${module.compute.db_ip}"
  vpc_id           = "${module.vpc.vpc_id}"
  wp_dev_public_id = "${module.compute.dev_ip}"
}
