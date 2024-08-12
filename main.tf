 #VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.prefix}-vpc"
  }
}

# Subnet
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr
  availability_zone = "ap-south-1a"

  tags = {
    Name = "${var.prefix}-subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.prefix}-igw"
  }
}

# Route Table
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.prefix}-route-table"
  }
}

# Route Table Association
resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}

# Security Group
resource "aws_security_group" "main" {
  vpc_id = aws_vpc.main.id
  name   = "${var.prefix}-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
 ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8081
    to_port = 8081
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 9000
    to_port = 9000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8081
    to_port = 8081
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }



  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.prefix}-sg"
  }
}

# EC2 Instance
resource "aws_instance" "main" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.main.id
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.main.id]
  associate_public_ip_address = "true"

  depends_on = [
    aws_security_group.main
  ]
  user_data = file("nexus.sh")
 #user_data = file("tomcat.sh")
 root_block_device {
    volume_size = "8"
    volume_type = "gp3"
     }
  tags = {
    Name = "${var.prefix}-instance"
  }
}

# EC2 Instance
resource "aws_instance" "tomcat" {
  ami           = var.ami_id
  instance_type = var.instance_type1
  subnet_id     = aws_subnet.main.id
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.main.id]
  associate_public_ip_address = "true"
 user_data = file("tomcat.sh")
  depends_on = [
    aws_security_group.main
  ]

 root_block_device {
    volume_size = "8"
    volume_type = "gp3"
     }
  tags = {
    Name = "${var.tomcat}-instance"
  }
 
}

# EC2 Instance
resource "aws_instance" "tomcat2" {
  ami           = var.ami_id
  instance_type = var.instance_type2
  subnet_id     = aws_subnet.main.id
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.main.id]
  associate_public_ip_address = "true"
 #user_data = file("nexus.sh")
 user_data = file("tomcat.sh")
  depends_on = [
    aws_security_group.main
  ]

 root_block_device {
    volume_size = "8"
    volume_type = "gp3"
     }
  tags = {
    Name = "${var.tomcat2}-instance"
  }
 
}