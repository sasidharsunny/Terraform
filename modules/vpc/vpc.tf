resource "aws_vpc" "myvpc" {
    cidr_block = "${var.cidr_block}"
    enable_dns_hostnames = true
    tags = {
        Name = "${var.vpc_tagname}"
	Owner = "sasidhar"

    }
}







resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "${var.myigw}"
  }
}