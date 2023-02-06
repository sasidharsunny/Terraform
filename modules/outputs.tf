output terraform-testvpc {
    value     =    module.terraform-testvpc.vpc_id
        
        
    
}

# output test-subnet-1_id {
#     value = "${module.terraform-testvpc.subnet1-public-id}"
# }

# output test-subnet-2_id {
#     value = "${module.terraform-testvpc.subnet2-public-id}"
# }

# output test-subnet-3_id {
#     value = "${module.terraform-testvpc.subnet3-public-id}"
# }

# output sg_id {
#     value = "${module.terraform-testvpc.sg-id}"
# }


output terraform-dev-vpc {
    value = "${module.terraform-dev-vpc.vpc_id}"
}