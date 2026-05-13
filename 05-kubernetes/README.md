## Modül 5: Kubernetes (K8s) - Konteyner Orkestrasyonu
Bu modülde, Docker Compose yapısından çıkıp, uygulamayı kurumsal standartlarda (Enterprise-Grade) bir Kubernetes (Minikube) kümesine taşıdım. Sistemin otomatik ölçeklenebilir (scalable), kendi kendini onarabilir (self-healing) ve veri kaybetmez (persistent) olmasını sağladım.

### 🏗️ Kubernetes Mimarisi ve Kullanılan Objeler
- **Deployment:** Flask uygulaması için `ReplicaSet` (3 kopya) kullanılarak yüksek erişilebilirlik (High Availability) sağlandı. Bir Pod silindiğinde anında yenisi yaratılıyor (Self-Healing).
- **StatefulSet & PVC (Persistent Volume Claim):** Veritabanı (Redis) geçici bir Pod yerine `StatefulSet` ile kurularak, Pod silinse dahi verinin kalıcı bir diske (Persistent Volume) yazılması garanti altına alındı.
- **ConfigMap:** Çevre değişkenleri (`FLASK_PORT`, `REDIS_HOST`) uygulama kodundan ayrıştırılarak merkezi ve güvenli bir yapıya (Decoupled Configuration) taşındı.
- **Service:** Pod'lara gelen trafiği eşit dağıtmak ve dışarıdan erişimi sağlamak için `NodePort` servisi kullanıldı.

### 🛡️ Uygulanan "Best Practice" Standartları
- **Resource Requests & Limits:** Konteynerlerin CPU ve RAM kullanımlarına "Request" (Garanti) ve "Limit" (Sınır) değerleri atanarak OOMKilled ve Throttling hatalarının önüne geçildi (QoS Management).
- **Liveness Probes:** K8s'in uygulamanın sadece çalışıp çalışmadığını değil, gerçekten sağlıklı yanıt verip vermediğini anlaması için `/` rotasına sağlık kontrolleri (Health Checks) eklendi.

---

## 🇺🇸 Module 5: Kubernetes (K8s) - Container Orchestration
In this module, I migrated the application from Docker Compose to an Enterprise-Grade Kubernetes (Minikube) cluster. I architected the system to be highly scalable, self-healing, and persistent.

### 🏗️ Kubernetes Architecture & Components
- **Deployment:** Ensured High Availability for the Flask app using a `ReplicaSet` (3 replicas). The system instantly spins up a new Pod if one is deleted (Self-Healing).
- **StatefulSet & PVC:** Deployed the Redis database using a `StatefulSet` and Persistent Volume Claims to guarantee data persistence even if the database Pod is terminated.
- **ConfigMap:** Decoupled environment variables (`FLASK_PORT`, `REDIS_HOST`) from the application code for centralized and secure configuration management.
- **Service:** Implemented `NodePort` services for load balancing internal traffic and enabling external access.

### 🛡️ Enterprise Best Practices Applied
- **Resource Requests & Limits:** Configured CPU and Memory `requests` and `limits` to prevent OOMKilled errors and CPU throttling, ensuring stable Quality of Service (QoS).
- **Liveness Probes:** Integrated HTTP health checks to allow the Kubelet to automatically restart containers if the application becomes unresponsive.