#!/bin/bash
# Sistem güncellemelerini al
apt-get update -y

# --- DOCKER KURULUMU ---
apt-get install -y docker.io
systemctl start docker
systemctl enable docker
usermod -aG docker ubuntu

# --- JENKINS KURULUMU ---
# Jenkins Java tabanlıdır
apt-get install -y fontconfig openjdk-17-jre

# Güncel Jenkins GPG Anahtarı ve Repo Tanımı (Senin eklediğin doğru kısım)
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Repoları güncelleyip Jenkins'i kuruyoruz
apt-get update -y
apt-get install -y jenkins
systemctl start jenkins
systemctl enable jenkins