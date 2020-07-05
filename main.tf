provider "aws" {
    region      = "ap-south-1"
}


resource "aws_instance" "k8Master"{
   ami                              = "ami-02d55cb47e83a99a0"
   instance_type                    = "t2.medium"
   vpc_security_group_ids           =  ["sg-0e3a30ce8672c32fc"]
   key_name                         = "Jenkinsci"
   associate_public_ip_address      = true
   tags                             = {
       Name                         = "master"
   }
   provisioner "local-exec" {
           command = "echo [master] '\n' ${aws_instance.k8Master.public_ip}|tee >> inventory"

        }
}

resource "aws_instance" "k8Worker"{
   ami                              = "ami-02d55cb47e83a99a0"
   instance_type                    = "t2.micro"
   vpc_security_group_ids           =  ["sg-0e3a30ce8672c32fc"]
   key_name                         = "Jenkinsci"
   associate_public_ip_address      = true
   tags                             = {
       Name                         = "worker"
   }
   provisioner "local-exec" {
           command = "echo  [worker] '\n' ${aws_instance.k8Worker.public_ip}|tee >> inventory"
        }
}
