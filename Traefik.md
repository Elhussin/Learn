```bash
/home/deploy/traefik/
├── docker-compose.yml          # تعريف Container
├── traefik.yml                 # الإعدادات الرئيسية
├── acme.json                   # شهادات SSL (يُنشأ تلقائياً)
├── .env                        # المتغيرات البيئية
├── config/
│   └── middlewares.yml         # إعدادات الأمان
├── logs/                       # اللوجات (تُنشأ تلقائياً)
│   ├── traefik.log
│   └── access.log
└── README.md                   # هذا الملف
```

## domain
```bash
A    @         3600    72.62.57.24
A    *         3600    72.62.57.24
A    traefik   3600    72.62.57.24
```

## permission
```bash
# إنشاء المجلدات
mkdir -p /home/deploy/traefik/{config,logs}
cd /home/deploy/traefik

# إنشاء ملف الشهادات
touch acme.json
chmod 600 acme.json

# إنشاء Docker network
docker network create web
1944ab7e76aba4631058f33d78ce1fda1d73df7b0473590f8491231d4c14aaa1
```