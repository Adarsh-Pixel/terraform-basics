#calling ec2 Module
module "ec2" {
    source      = "./ec2"
    sg          = module.sg.sgid   # Step 2: Passing the info to the module that needs this variable over the root module
}

#calling sg Module
module "sg" {
    source      = "./sg"
}