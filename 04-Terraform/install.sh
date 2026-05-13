#!/bin/bash
# Sistem güncellemelerini al
apt-get update -y

# --- DOCKER KURULUMU ---
apt-get install -y docker.io
systemctl start docker
systemctl enable docker
usermod -aG docker ubuntu # Ubuntu kullanıcısına Docker yetkisi veriyoruz

# --- JENKINS KURULUMU ---
# Jenkins Java tabanlıdır, bu yüzden önce Java 17 kuruyoruz
apt-get install -y fontconfig openjdk-17-jre

# Jenkins'in resmi repolarını sistemimize ekliyoruz
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Repoları güncelleyip Jenkins'i kuruyoruz
apt-get update -y
apt-get install -y jenkins
systemctl start jenkins
systemctl enable jenkins