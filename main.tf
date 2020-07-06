provider "aws" {
    region      = "ap-south-1"
}

resource "aws_key_pair" "main" {
    key_name      = "publickey" 
  public_key      = file(var.public_key_file)
    
}
resource "aws_instance" "k8Master"{
   ami                              = "ami-02d55cb47e83a99a0"
   instance_type                    = var.master_instance_type
   vpc_security_group_ids           =  ["sg-0e3a30ce8672c32fc"]
   key_name                         = aws_key_pair.main.key_name
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
   instance_type                    = var.worker_instance_type
   vpc_security_group_ids           =  ["sg-0e3a30ce8672c32fc"]
   key_name                         = aws_key_pair.main.key_name
   associate_public_ip_address      = true
   tags                             = {
       Name                         = "worker"
   }
   provisioner "local-exec" {
           command = "echo  [worker] '\n' ${aws_instance.k8Worker.public_ip}|tee >> inventory"
        }
}
