resource "aws_instance" "web-1" {
    count = "${var.maximumcount}"
    # ami = var.imagename
    ami = "${var.imagename}"
    instance_type = "${var.instance_type}"
    # key_name = "${var.key_name}"
    subnet_id = "${element(var.subnet_id, count.index)}"
    vpc_security_group_ids = ["${var.sg_id}"]
    associate_public_ip_address = true	
    tags = {
        Name = "server-${count.index+1}"
        Env = "Prod"
        Owner = "Sree"
	CostCenter = "ABCD"
    }
}