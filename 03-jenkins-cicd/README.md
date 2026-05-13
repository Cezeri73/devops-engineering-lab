# 🚀 DevOps Engineering Lab

## 🇹🇷 Modül 3: Jenkins ile Uçtan Uca CI/CD Pipeline
Bu aşamada, manuel süreçleri tamamen otomatize ederek profesyonel bir DevOps boru hattı (pipeline) inşa ettim.

### 🏗️ Neler Yapıldı?
- **Pipeline as Code:** Tüm süreçleri `Jenkinsfile` kullanarak tanımladım.
- **DooD (Docker outside of Docker):** Jenkins konteyneri üzerinden ana sistemdeki Docker motorunu yönettim.
- **Otomasyon:** GitHub Poll SCM ile kod değişikliğini otomatik algılayan bir yapı kurdum.
- **Aşamalar:** Checkout -> Test (Simulated) -> Build -> Deploy.

### 🛠️ Teknik Kazanımlar
- Jenkins çevre değişkenleri (Environment Variables) yönetimi.
- Docker Compose ve Jenkins entegrasyonu.
- Başarıyla yönetilen CI/CD döngüsü.

---

## 🇺🇸 Module 3: End-to-End CI/CD Pipeline with Jenkins
In this stage, I built a professional DevOps pipeline by fully automating manual processes.

### 🏗️ Key Achievements
- **Pipeline as Code:** Defined all CI/CD processes using a `Jenkinsfile`.
- **DooD (Docker outside of Docker):** Managed the host Docker daemon from within the Jenkins container.
- **Automation:** Configured Poll SCM to trigger builds automatically on every code change.
- **Stages:** Checkout -> Test (Simulated) -> Build -> Deploy.

### 🛠️ Technical Skills
- Managing Jenkins Environment Variables.
- Docker Compose and Jenkins integration.
- Successfully managed full CI/CD lifecycle.

---

### 🚦 Nasıl Çalışır? / How it Works?
Sistem her `git push` sonrası otomatik tetiklenir ve uygulamayı `http://localhost:9090` adresinde günceller.
The system triggers automatically after every `git push` and updates the app at `http://localhost:9090`.