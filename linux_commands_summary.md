
# Linux Commands Summary

## 1. إدارة الخدمات (Services Management)

### عرض كل الخدمات النشطة
```bash
systemctl list-units --type=service
```

### البحث عن خدمة باسم معين
```bash
systemctl list-units --type=service | grep -i service_name
```

### إيقاف خدمة
```bash
sudo systemctl stop service_name
```

### تعطيل خدمة من التشغيل التلقائي
```bash
sudo systemctl disable service_name
```

### تشغيل خدمة
```bash
sudo systemctl start service_name
```

### تفعيل خدمة للتشغيل التلقائي
```bash
sudo systemctl enable service_name
```

### تحديد الحد الأقصى للذاكرة أو المعالج لخدمة
افتح ملف إعداد الخدمة:
```bash
sudo systemctl edit service_name
```
أضف:
```ini
[Service]
MemoryMax=500M
CPUQuota=50%
```
ثم:
```bash
sudo systemctl daemon-reload
sudo systemctl restart service_name
```

---

## 2. مراقبة استهلاك الذاكرة

### عرض العمليات حسب استهلاك RAM
```bash
top
```
اضغط `M` لترتيب حسب الذاكرة.

### النسخة المطورة والملونة
```bash
sudo apt install htop
htop
```

### عرض أعلى 10 عمليات تستهلك RAM
```bash
ps aux --sort=-%mem | head -n 11
```

### عرض الاستهلاك الكلي للذاكرة
```bash
free -h
```

---

## 3. إدارة المستخدمين

### حذف مستخدم فقط
```bash
sudo deluser username
```

### حذف مستخدم مع مجلد Home
```bash
sudo deluser --remove-home username
```

### حذف مستخدم مع جميع ملفاته
```bash
sudo deluser --remove-all-files username
```

### إزالة مستخدم من مجموعة معينة
```bash
sudo deluser username groupname
```

### التأكد من وجود مستخدم
```bash
grep '^username:' /etc/passwd
```

---

## 4. سكريبت لإدارة الخدمات الاختيارية

احفظ الكود في ملف `manage_optional_services.sh`:
```bash
#!/bin/bash

# قائمة الخدمات
SERVICES=(
    apache2
    nginx
    bluetooth
    avahi-daemon
    cups-browsed
    cups
    ModemManager
    openvpn
)

if [ "$1" == "stop" ]; then
    echo "Stopping optional services..."
    for service in "${SERVICES[@]}"; do
        sudo systemctl stop "$service" 2>/dev/null
        sudo systemctl disable "$service" 2>/dev/null
        echo "Stopped $service"
    done
elif [ "$1" == "start" ]; then
    echo "Starting optional services..."
    for service in "${SERVICES[@]}"; do
        sudo systemctl enable "$service" 2>/dev/null
        sudo systemctl start "$service" 2>/dev/null
        echo "Started $service"
    done
else
    echo "Usage: $0 start | stop"
    exit 1
fi
```
منح صلاحيات التنفيذ:
```bash
chmod +x manage_optional_services.sh
```

تشغيل:
```bash
./manage_optional_services.sh stop
./manage_optional_services.sh start
```


#هعمل لك أمر واحد (أو بالأصح سكريبت صغير) تبحث به عن أي برنامج في Ubuntu، وهو يحدد لك إذا كان مثبت من apt أو snap أو dpkg، ويعطيك أمر الحذف المناسب مباشرة.

# creat file
```bash
nano find_and_remove.sh
```
# insert code
```bash
#!/bin/bash

if [ -z "$1" ]; then
    echo "⚠️ الاستخدام: $0 اسم_البرنامج"
    exit 1
fi

PROGRAM=$1

echo "🔍 البحث عن: $PROGRAM"

# البحث في apt
APT_RESULT=$(dpkg --list | grep -i "$PROGRAM")
if [ -n "$APT_RESULT" ]; then
    echo "✅ البرنامج موجود في apt:"
    echo "$APT_RESULT"
    echo "🗑 لحذفه:"
    echo "sudo apt purge $PROGRAM && sudo apt autoremove"
fi

# البحث في snap
SNAP_RESULT=$(snap list | grep -i "$PROGRAM")
if [ -n "$SNAP_RESULT" ]; then
    echo "✅ البرنامج موجود في snap:"
    echo "$SNAP_RESULT"
    echo "🗑 لحذفه:"
    echo "sudo snap remove $PROGRAM"
fi

# البحث في dpkg (ملفات deb)
DPKG_RESULT=$(dpkg --get-selections | grep -i "$PROGRAM")
if [ -n "$DPKG_RESULT" ] && [ -z "$APT_RESULT" ]; then
    echo "✅ البرنامج موجود عبر dpkg:"
    echo "$DPKG_RESULT"
    echo "🗑 لحذفه:"
    echo "sudo dpkg --purge $PROGRAM"
fi

if [ -z "$APT_RESULT" ] && [ -z "$SNAP_RESULT" ] && [ -z "$DPKG_RESULT" ]; then
    echo "❌ لم يتم العثور على البرنامج في apt أو snap أو dpkg."
fi
```
# إعطاء صلاحيات التشغيل
```bash
chmod +x find_and_remove.sh
```
# run code
```bash
./find_and_remove.sh azuredatastudio
./find_and_remove.sh اسم_البرنامج
```


# find all install app
```
echo "=== APT / DPKG Packages ==="
dpkg --list | awk '{print $2}' | tail -n +6
echo "=== SNAP Packages ==="
snap list | awk '{print $1}' | tail -n +2
```
