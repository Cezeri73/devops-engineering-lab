# VPC Kaynağımız
resource "aws_vpc" "main_lab_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "devops-lab-vpc"
  }
}

# Public Subnet Kaynağımız
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main_lab_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "devops-lab-public-subnet"
  }
}

# Internet Gateway (IGW) - Dış Dünya Bağlantısı
resource "aws_internet_gateway" "lab_igw" {
  vpc_id = aws_vpc.main_lab_vpc.id

  tags = {
    Name = "devops-lab-igw"
  }
}

# Route Table (Yönlendirme Tablosu)
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_lab_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab_igw.id
  }

  tags = {
    Name = "devops-lab-public-rt"
  }
}

# Route Table Association (Tabloyu Subnet'e Bağlama)
resource "aws_route_table_association" "public_subnet_assoc" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}