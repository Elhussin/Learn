# Crate projeact first step
```bash
mkdir tenant_project
cd tenant_project
python -m venv venv
source venv/bin/activate  # أو venv\Scripts\activate في Windows
```
### install dependencies
```bash
pip install django djangorestframework psycopg2-binary django-tenants
```

### create project
```bash     
django-admin startproject optics_tenant
```

### create app
```bash
python manage.py startapp customers
python manage.py startapp orders
python manage.py startapp core
python manage.py startapp accounts
```

### create database
```bash
CREATE DATABASE optics_tenant;
CREATE USER taha WITH PASSWORD '3112';
GRANT ALL PRIVILEGES ON DATABASE optics_tenant TO taha;
GRANT USAGE ON SCHEMA public TO taha;
GRANT CREATE ON SCHEMA public TO taha;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO taha;

```

### create .env file
```bash
SECRET_KEY = <secret_key>
DEBUG=True

DB_NAME=db_name
DB_USER=db_user
DB_PASSWORD=db_password
DB_HOST=db_host
DB_PORT=db_port
```

### email
```bash
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_USE_TLS = True
EMAIL_HOST_USER = 'your_email@gmail.com'
EMAIL_HOST_PASSWORD = 'your_email_password'
```

### Add settings to project
```bash
optics_tenant/settings.py
```
> add database settings
```bash
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': config('DB_NAME'),
        'USER': config('DB_USER'),
        'PASSWORD': config('DB_PASSWORD'),
        'HOST': config('DB_HOST', default='localhost'),
        'PORT': config('DB_PORT', default='5432'),
    }
}
```
> add installed apps
```bash
INSTALLED_APPS = [
    'django_tenants',
    'customers',
    'django apps..',
    'another app',
]
```
> add middleware
```bash
MIDDLEWARE = [
    'django_tenants.middleware.main.TenantMainMiddleware',
    ... another middleware
]
```

> add tenant model for apps

># create shared database
```bash
python manage.py makemigrations customers
python manage.py migrate_schemas --shared  # create shared database
```



### create main admin from shell

```bash
python manage.py shell
from django_tenants.utils import get_tenant_model,get_tenant_domain_model

TenantModel = get_tenant_model()
DomainModel = get_tenant_domain_model()

# إنشاء التينانت الرئيسي (العام) لو مش موجود
tenant, created = TenantModel.objects.get_or_create(
    schema_name='public',
    defaults={
        'name': 'Main Site',
        'paid_until': '2030-12-31',
        'on_trial': False
    }
)

# ربط التينانت بالدومين 127.0.0.1
DomainModel.objects.get_or_create(
    domain='127.0.0.1',
    tenant=tenant,
    is_primary=True
)
```

### create tenant 

```bash
python manage.py shell
from customers.models import Client, Domain

# إنشاء العميل (Tenant)
tenant = Client(
    schema_name='store1',           # اسم السكيما لهذا العميل (يظهر في Postgres)
    name='Solo Vision Store 1',     # اسم العميل (اختياري)
    paid_until='2030-01-01',
    on_trial=True,
)
tenant.save()  # هذا سينشئ السكيما store1 تلقائيًا

# ربط الدومين الفرعي بالسكيما
domain = Domain()
domain.domain = 'store1.localhost'  # مثل store1.yourdomain.com
domain.tenant = tenant
domain.is_primary = True
domain.save()
```



```bash
python manage.py makemigrations core orders
python manage.py migrate_schemas --tenant 
python manage.py migrate_schemas --shared ## create tenant database
```


# creat super user for main admin
```bash
python manage.py createsuperuser
```

# craet super user for tenant
```bash
from django_tenants.utils import schema_context
from django.contrib.auth import get_user_model

User = get_user_model()

with schema_context('store1'):
    User.objects.create_superuser(
        username='admin',
        email='admin@store1.com',
        password='adminpass123'
    )
```

### add domain to hosts
C:\Windows\System32\drivers\etc\hosts

127.0.0.1       store1.localhost
127.0.0.1       store2.localhost
127.0.0.1       store3.localhost




# test email
```bash
python manage.py shell
from django.core.mail import send_mail

send_mail(
    'Test Email',
    'This is a test email.',
    'hasin.taha@yahoo.com',
    ['hasin.taha@yahoo.com'],
    fail_silently=False,
)
```


from django.core.mail import send_mail

send_mail(
    subject='Test Email',
    message='Hello, this is a test email from Django.',
    from_email='hasin.taha@yahoo.com',
    recipient_list=['hasin3112@gmail.com'],
    fail_silently=False
)
