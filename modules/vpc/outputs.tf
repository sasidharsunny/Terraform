output "vpc_id" {
    value = "${aws_vpc.myvpc.id}"

}

output "all-subnet-public-id" {
    value = "${aws_subnet.subnet-public.*.id}"
    
}

output "sg_id" {
    value = "${aws_security_group.allow_all.id}"
    
}



# output "subnet1-public-id" {
#     value = "${aws_subnet.subnet-public.0.id}"
    
# }

# output "subnet2-public-id" {
#     value = "${aws_subnet.subnet-public.1.id}"
    
# }

# output "subnet3-public-id" {
#     value = "${aws_subnet.subnet-public.2.id}"
    
# }

# output "subnet1-private-id" {
#     value = "${aws_subnet.subnet-private.0.id}"
    
# }

# output "subnet2-private-id" {
#     value = "${aws_subnet.subnet-private.1.id}"
    
# }

# output "subnet3-private-id" {
#     value = "${aws_subnet.subnet-private.2.id}"
    
# }




