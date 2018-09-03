output "wp_rds_subnetgroup_name" {
  value = "${aws_db_subnet_group.wp_rds_subnetgroup.name}"
}

output "wp_dev_sg_id" {
  value = "${aws_security_group.wp_dev_sg.id}"
}

output "wp_rds_sg_id" {
  value = "${aws_security_group.wp_rds_sg.id}"
}

output "wp_public_sg_id" {
  value = "${aws_security_group.wp_public_sg.id}"
}

output "wp_private_sg_id" {
  value = "${aws_security_group.wp_private_sg.id}"
}

output "public_subnets" {
  value = "${aws_subnet.wp_public_subnets.*.id}"
}

output "private_subnets" {
  value = "${aws_subnet.wp_private_subnets.*.id}"
}

output "bucketname" {
  value = "${aws_s3_bucket.code.bucket}"
}

output "vpc_id" {
  value = "${aws_vpc.wp_vpc.id}"
}