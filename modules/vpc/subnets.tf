# resource "aws_subnet" "subnet1-public" {
#     vpc_id = "${aws_vpc.myvpc.id}"
#     cidr_block = "${var.public_subnet1_cidr}"
    

#     tags = {
#         Name = "${var.public_subnet1_name}"
#     }
# }

resource "aws_subnet" "subnet-public" {
    count = "${length(var.public_cidr_block)}"
    vpc_id = "${aws_vpc.myvpc.id}"
    cidr_block = "${element(var.public_cidr_block, count.index)}"
    availability_zone = "${element(var.azs , count.index)}"
    tags = {
        Name = "server-${count.index+1}"
    }
}


resource "aws_subnet" "subnet-private" {
    count = "${length(var.private_cidr_block)}"
    vpc_id = "${aws_vpc.myvpc.id}"
    cidr_block = "${element(var.private_cidr_block, count.index)}"
    availability_zone = "${element(var.azs , count.index)}"
    tags = {
        Name = "server-${count.index+1}"
    }
}



# resource "aws_subnet" "subnet2-public" {
#     vpc_id = "${aws_vpc.myvpc.id}"
#     cidr_block = "${var.public_subnet2_cidr}"
   

#     tags = {
#         Name = "${var.public_subnet2_name}"
#     }
# }




# resource "aws_subnet" "subnet3-public" {
#     vpc_id = "${aws_vpc.myvpc.id}"
#     cidr_block = "${var.public_subnet3_cidr}"
    

#     tags = {
#         Name = "${var.public_subnet3_name}"
#     }
# }