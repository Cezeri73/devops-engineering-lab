# 1. Aşama: Build
FROM python:3.9-slim AS builder
WORKDIR /build
COPY requirements.txt .
# --user flag'i paketleri /root/.local altına kurar
RUN pip install --user --no-cache-dir -r requirements.txt

# 2. Aşama: Final
FROM python:3.9-alpine
WORKDIR /app

# Paketleri kopyalarken hedefi netleştiriyoruz
COPY --from=builder /root/.local /home/worker/.local
COPY app.py .

# Güvenlik: Kullanıcıyı oluştur
RUN adduser -D worker
# Klasör yetkilerini worker'a ver (Burası kritik!)
RUN chown -R worker:worker /home/worker
USER worker

# Python'a paketlerin yerini söylüyoruz (En kritik satır!)
ENV PYTHONPATH=/home/worker/.local/lib/python3.9/site-packages
ENV PATH=/home/worker/.local/bin:$PATH

EXPOSE 5000
CMD ["python", "app.py"]