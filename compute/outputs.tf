output "elb_dnsname" {
  value = "${aws_elb.wp_elb.dns_name}"
}

output "elb_zoneid" {
  value = "${aws_elb.wp_elb.zone_id}"
}

output "db_ip" {
  value = "${aws_db_instance.wp_db.address}"
}

output "dev_ip" {
  value = "${aws_instance.wp_dev.public_ip}"
}