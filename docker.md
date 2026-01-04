<!--  -->

# starts douker app

sudo usermod -aG docker $USER
newgrp docker
docker-compose up --build

sudo docker-compose up --build

sudo apt remove docker-compose -y
sudo apt update
sudo apt install docker-compose-plugin -y
docker compose up --build


docker ps -a


1. إيقاف جميع الحاويات:
   أولاً، يجب عليك إيقاف أي حاويات قيد التشغيل. استخدم هذا الأمر:



bash
Copy code
docker stop $(docker ps -aq)
هذا الأمر يوقف جميع الحاويات.

2. حذف جميع الحاويات:
   بعد إيقاف الحاويات، يمكنك حذف جميع الحاويات باستخدام الأمر التالي:

bash
Copy code
docker rm $(docker ps -aq)
هذا سيحذف جميع الحاويات المتوقفة.

3. حذف جميع الصور:
   لحذف جميع الصور (images) التي تم تنزيلها على جهازك:

bash
Copy code
docker rmi $(docker images -q)
هذا سيحذف جميع الصور التي تم تنزيلها من Docker.

4. حذف جميع الشبكات غير المستخدمة:
   يمكنك أيضًا حذف جميع الشبكات غير المستخدمة بواسطة هذا الأمر:

bash
Copy code

docker network prune

5. حذف جميع الحجوم (volumes) غير المستخدمة:
   إذا كنت ترغب في حذف جميع الحجوم غير المستخدمة (volumes):

bash
Copy code
docker volume prune

6. حذف كل شيء في Docker (الحاويات، الصور، الشبكات، الحجوم):
   إذا كنت ترغب في تنظيف Docker بشكل كامل (مما يؤدي إلى حذف كل شيء):

bash
Copy code
docker system prune -a
هذا سيحذف كل شيء (الحاويات، الصور، الشبكات، الحجوم) غير المستخدم.

docker run -d -p 8000:8000 --name your_container_name your_image_name

# build docker image

docker compose down --volumes
docker compose build --no-cache
docker compose up -d

# stop docker image

docker compose down

# stop docker image with volumes إيقاف كل شيء

docker compose down -v

# remove all images حذف الصور القديمة (اختياري)

```bash
docker compose down --rmi all
```

# remove all containers

docker rm -f frontend

<!--حذف كل شيء ما عد البيانات   -->

docker system prune -a

<!-- حذف كل شيء والبيانات  -->

docker system prune -a --volumes

# إيقاف كل شيء

docker compose down -v

# إيقاف جميع الحاويات التي تعمل حالياً

docker stop $(docker ps -q)

# حذف الصور القديمة (اختياري)

docker compose down --rmi all

# حذف جميع الحجوم (volumes) غير المستخدمة:

docker system prune -a --volumes -f

# بناء من جديد

docker compose build --no-cache
docker compose up -d --build 

docker compose up -d
docker compose -f docker-compose.local.yml up --build

#

docker restart backend

sudo systemctl restart docker

docker compose logs -f

# connect to postgres

psql -h localhost -p 5432 -U taha -d summary_db

#
docker exec -it optics_backend python manage.py shell

docker compose exec backend python manage.py migrate

docker compose exec backend python manage.py makemigrations

docker compose exec backend python manage.py createsuperuser

docker compose exec backend python manage.py shell

docker compose exec backend python manage.py collectstatic --noinput

docker compose exec backend sh

source /app/venv/bin/activate
python manage.py createsuperuser
python manage.py shell
exit

#

# استخدم اسم الحاوية 'nginx_reverse_proxy' للوصول إليها

docker exec nginx_reverse_proxy nginx -s reload

docker exec -it postgres_db psql -U taha -d summary

# Password: summary_pass

# View all logs

docker compose logs -f

# View specific service logs

docker compose logs backend -f

# Restart services

docker compose restart

# Stop everything

docker compose down

# Check status

docker compose ps



<!-- خيار --remove-orphans سيقوم بحذف الحاويات القديمة التي كانت باسم db والتي لم نعد بحاجة إليها، وهذا لن يؤثر على البيانات.

هل أنفذ أوامر إعادة التشغيل الآن؟

Good -->
# 1. تحديث وتشغيل Summary
cd c:\code\summary
docker compose up -d --remove-orphans

# 2. تحديث وتشغيل Optics Tenant
cd c:\code\optics_tenant
docker compose up -d --remove-orphans