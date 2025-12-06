# PDM Quick Start Guide

هذا الملف يلخص أهم أوامر **PDM** لإدارة حزم Python بطريقة حديثة تعتمد على `pyproject.toml`.

---

## 📦 التثبيت

### باستخدام pip

```bash
pip install pdm
```

### باستخدام curl

```bash
curl -sSL https://pdm-project.org/install-pdm.py | python3 -
```

### باستخدام PowerShell على ويندوز

```powershell
powershell -ExecutionPolicy ByPass -c "irm https://pdm-project.org/install-pdm.py | py -"
```

### التحقق من التثبيت

```bash
pdm --version
```

---

## 🚀 بدء مشروع جديد

```bash
pdm init
```

### عرض بيانات الحزمة

```bash
pip show pdm
```

---

## 📥 إضافة المتطلبات

### استيراد المتطلبات من `requirements.txt`

```bash
pdm import requirements.txt
```

### إضافة حزم

```bash
pdm add <package-name>
```

مثال:

```bash
pdm add django
```

### إضافة حزم للتطوير

```bash
pdm add --dev <package-name>
```

أو:

```bash
pdm add -dG dev <package-name>
```

مثال:

```bash
pdm add --dev pytest black
```

---

## 🔒 إدارة الإصدارات (Lock)

### قفل الإصدارات

```bash
pdm lock
```

### تحديث الإصدارات

```bash
pdm update
```

---

## 🏃 تشغيل المشروع

### تشغيل أوامر Django

```bash
pdm run python manage.py runserver
pdm run python manage.py startapp <app-name>
```

### الدخول إلى بيئة PDM التفاعلية

```bash
pdm shell
python manage.py startapp <app-name>
```

---

## 🐳 استخدام PDM مع Docker

### مثال على Dockerfile

```dockerfile
FROM python:3.12-slim
WORKDIR /app

# تثبيت PDM
RUN pip install pdm

# نسخ ملفات المشروع
COPY pyproject.toml pdm.lock ./
RUN pdm install --prod --no-editable

COPY . .

# تشغيل التطبيق
CMD ["pdm", "run", "python", "main.py"]
```

---

### إنشاء ملف `requirements.txt`

```bash
pdm export -f requirements --without-hashes > requirements.txt
```

### إنشاء ملف `requirements-dev.txt`

```bash
pdm export -f requirements > requirements.txt
```
