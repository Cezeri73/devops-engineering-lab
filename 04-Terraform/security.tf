resource "aws_security_group" "lab_sg" {
  name        = "devops-lab-sg"
  description = "Allow SSH, Jenkins and Flask inbound traffic"
  vpc_id      = aws_vpc.main_lab_vpc.id

  # Ingress: İçeri Giriş İzinleri
  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Jenkins Access"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Flask App Access"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress: Dışarı Çıkış İzinleri
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 tüm protokollere izin verir
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devops-lab-sg"
  }
}