# 1. SSH Anahtarını AWS'e Yükleme Kaynağı
resource "aws_key_pair" "lab_key" {
  key_name   = "devops-lab-key"
  public_key = file("~/.ssh/devops_lab_key.pub")
}

# 2. En güncel Ubuntu 22.04 imajını dinamik bulma
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# 3. EC2 Sunucumuzu Oluşturma
resource "aws_instance" "lab_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = aws_key_pair.lab_key.key_name

  subnet_id                   = aws_subnet.public_subnet_1.id
  vpc_security_group_ids      = [aws_security_group.lab_sg.id]
  associate_public_ip_address = true

  # EKLENEN YENİ PARAMETRE: Otomasyon Dosyamız
  user_data = file("install.sh")

  tags = {
    Name = "devops-lab-ubuntu-server"
  }
}