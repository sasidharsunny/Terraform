resource "aws_route_table" "terraform-public" {
    vpc_id = "${aws_vpc.myvpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }

    tags = {
        Name = "${var.public_Routing_Table}"
    }
}

resource "aws_route_table" "terraform-private" {
    vpc_id = "${aws_vpc.myvpc.id}"
   tags = {
        Name = "${var.private_Routing_Table}"
    }
}





resource "aws_route_table_association" "terraform-public-1" {
    count = "${length(var.public_cidr_block)}"
    subnet_id = "${element(aws_subnet.subnet-public.*.id, count.index)}"
    route_table_id = "${aws_route_table.terraform-public.id}"
    
}


resource "aws_route_table_association" "terraform-private-1" {
    count = "${length(var.private_cidr_block)}"
    subnet_id = "${element(aws_subnet.subnet-private.*.id, count.index)}"
    route_table_id = "${aws_route_table.terraform-private.id}"
    
}

# resource "aws_route_table_association" "terraform-public-2" {
#     subnet_id = "${aws_subnet.subnet2-public.id}"
#     route_table_id = "${aws_route_table.terraform-public.id}"
# }

# resource "aws_route_table_association" "terraform-public-3" {
#     subnet_id = "${aws_subnet.subnet3-public.id}"
#     route_table_id = "${aws_route_table.terraform-public.id}"
# }