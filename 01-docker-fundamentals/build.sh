#!/bin/bash

# Değişken Tanımlama
APP_NAME="murat-devops-app"
TIMESTAMP=$(date +%Y%m%d%H%M)

echo "🛠️ Build başlatılıyor: $APP_NAME:$TIMESTAMP"

# Imajı Build Etme
docker build -t $APP_NAME:$TIMESTAMP .

# Test Etmek İçin Çalıştır
echo "🚀 Uygulama 5000 portunda ayağa kalkıyor..."
docker run -d -p 9090:5000 $APP_NAME:$TIMESTAMP