provider "aws" {
   
    access_key = "AKIAXOHB53QC56ZM2VTM"
    secret_key = "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"
    region = "us-west-1"
}

terraform {
  required_version = "<= 1.3.14" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 5.0.0" #Forcing which version of plugin needs to be used.
      source = "hashicorp/aws"
    }
  }
}


module terraform-testvpc {
   source = "./modules/vpc"
   cidr_block = "10.0.0.0/16"
   vpc_tagname = "my-test-vpc"
   myigw = "my-aws_internet_gateway"
   public_cidr_block = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
   private_cidr_block = ["10.0.10.0/24","10.0.20.0/24","10.0.30.0/24"]
   public_Routing_Table  = "public-routing-table"
   private_Routing_Table = "private-routing-table"
   azs = ["us-west-1a","us-west-1c","us-west-1c"]
 }


module terraform-ec2 {
   source = "./modules/ec2"
   subnet_id = "${module.terraform-testvpc.all-subnet-public-id}"
   instance_type = "t2.micro"
   key_name = "LaptopKey"
   sg_id =  "${module.terraform-testvpc.sg_id}"
   imagename = "ami-09b2a1e33ce552e68"
   maximumcount =  3



 }












  #  public_subnet1_name = "subnet-1"
  #  public_subnet2_cidr = "10.0.2.0/24"
  #  public_subnet2_name = "subnet-2"
  #  public_subnet3_cidr = "10.0.3.0/24"
  #  public_subnet3_name = "subnet-3"
 

 
# module terraform-dev-vpc {
#    source = "./modules/vpc"
#    cidr_block = "10.0.0.0/16"
#    vpc_tagname = "my-dev-vpc"
#    myigw = "my-aws_internet_gateway"
#    public_cidr_block = "10.0.10.0/24"
#    public_subnet1_name = "subnet-1"
#    public_subnet2_cidr = "10.0.20.0/24"
#    public_subnet2_name = "subnet-2"
#    public_subnet3_cidr = "10.0.30.0/24"
#    public_subnet3_name = "subnet-3"
#    Main_Routing_Table  = "main-routing-table"
#  }

#  module  {
#    source = "./modules/vpc"
#    cidr_block = "10.0.0.0/16"
#    vpc_tagname = "my-dev-vpc"
#    myigw = "my-aws_internet_gateway"
#    public_subnet1_cidr = "10.0.10.0/24"
#    public_subnet1_name = "subnet-1"
#    public_subnet2_cidr = "10.0.20.0/24"
#    public_subnet2_name = "subnet-2"
#    public_subnet3_cidr = "10.0.30.0/24"
#    public_subnet3_name = "subnet-3"
#    Main_Routing_Table  = "main-routing-table"
#  }


#  module terraform-ec2 {
#  source = "./modules/ec2"
#  subnet_id = "${module.terraform-dev-vpc.subnet1-public-id}"
#  servername = "server-module"
#  sg_id = "${module.terraform-dev-vpc.sg-id}"

#  }