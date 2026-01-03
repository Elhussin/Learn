لإضافة تطبيق جديد (مثل dashboard) إلى استضافتك بنفس الطريقة (Docker + Nginx Gateway)، الخطوات بسيطة وموحدة جداً الآن:

1. تجهيز التطبيق (
docker-compose.yml
)
في مجلد التطبيق الجديد (c:\code\dashboard)، أنشئ ملف docker-compose.yml بهذه المواصفات:

الشبكة: اربطه بشبكة osm_shared_network كشبكة خارجية.
المنافذ: لا تفتح منافذ (ports) للخارج (مثل 80:80)، فقط expose للمنفذ الداخلي (مثل 3000 أو 8000).
الاسم: اختر اسم خدمة وحاوية فريدين (مثلاً dashboard_app).
مثال:

yaml
services:
  app:
    build: .
    container_name: dashboard_app
    restart: always
    expose:
      - "3000"  # منفذ التطبيق الداخلي
    networks:
      - app-network
networks:
  app-network:
    name: osm_shared_network
    external: true
2. تحديث Gateway (nginx.conf)
عليك إضافة التطبيق الجديد إلى ملف nginx.conf في مشروع الـ Gateway:

عرف الـ Upstream:
nginx
upstream dashboard_upstream {
    server dashboard_app:3000;
}
أضف Server Block جديد: اختر الدومين الفرعي (مثل dashboard.osmbeta.cloud) واستخدم نفس إعدادات SSL الموحدة (Wildcard).
nginx
server {
    listen 443 ssl;
    http2 on;
    server_name dashboard.osmbeta.cloud; # الدومين الفرعي
    
    # نفس الشهادة الموحدة!
    ssl_certificate /etc/letsencrypt/live/osmbeta.cloud/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/osmbeta.cloud/privkey.pem;
    
    location / {
        proxy_pass http://dashboard_upstream;
        # ... (نفس الهيدرات القياسية) ...
    }
}
3. التطبيق (Deploy)
ارفع الكود للسيرفر.
شغل التطبيق: docker compose up -d (داخل مجلد dashboard).
أعد تشغيل Nginx ليقرأ التعديلات: docker restart gateway_nginx.
النتيجة: سيعمل التطبيق فوراً على https://dashboard.osmbeta.cloud بشهادة آمنة وبدون أي تعقيدات في الشبكة أو المنافذ. 🚀