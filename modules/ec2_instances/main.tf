resource "aws_instance" "heating" {
  ami           = "ami-0e5f882be1900e43b"  
  instance_type = "t2.micro"           

  subnet_id     = var.subnet_id[0]
  key_name      = "UYScutiKey"
  vpc_security_group_ids = var.security_group_ids
  associate_public_ip_address = true 

  tags = {
    Name = "heating"
  }
  }

  resource "aws_instance" "lights" {
  ami           = "ami-0e5f882be1900e43b"  
  instance_type = "t2.micro"           

  subnet_id     = var.subnet_id[1]
  key_name      = "UYScutiKey"
  vpc_security_group_ids = var.security_group_ids
  associate_public_ip_address = true 
  tags = {
    Name = "lights"
  }
  }

  resource "aws_instance" "status" {
  ami           = "ami-0e5f882be1900e43b"  
  instance_type = "t2.micro"           

  subnet_id     = var.subnet_id[2]
  key_name      = "UYScutiKey"
  vpc_security_group_ids = var.security_group_ids
  associate_public_ip_address = true 
  tags = {
    Name = "status"
  }
  }

    resource "aws_instance" "auth" {
  ami           = "ami-0e5f882be1900e43b"  
  instance_type = "t2.micro"           

  subnet_id     = var.subnet_id[2]
  key_name      = "UYScutiKey"
  vpc_security_group_ids = var.security_group_ids
  associate_public_ip_address = true 
  tags = {
    Name = "auth"
  }
  }