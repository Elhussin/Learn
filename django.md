# Django



## requirements

- Python (version 3.6 or higher)
- pip (Python package manager)

### Install Python And pip
[Python](https://www.python.org/downloads/)

### install pip
```pash
python3 -m ensurepip --upgrade
```
```shell
python3 -m pip install --upgrade pip
```
### Verify Python and pip Installation
```shell
python --version
pip --version
```
### create virtual environment
```shell
python -m venv <directory>
python -m venv env
```
### activate virtual environment
```shell
python -m venv <directory>
```

### deactivate virtual environment
```shell
deactivate
```

### install django
`python3 -m pip install Django`

### verify django
`python3 -m django --version`
### create project
`django-admin startproject <project_name>`

### run server
```shell
python3 manage.py runserver
```

### Access the Django Application
`http://127.0.0.1:8000/`

### Create app
```shell
python3 manage.py startapp <app_name>
``` 

### add uor abb name to setting in project root


### makemigrations
```shell
python manage.py makemigrations <app_name>
```
```shell
python manage.py migrate
```
### createsuperuser 
```shell
python manage.py createsuperuser
```

### To open python shell
```shell
python
```


### to add table for session in date bas
```shell
python manage.py makemigrations network 
```
```shell
python manage.py migrate
```

### to creat dat base file


## creat user
`python manage.py createsuperuser`


### use postgress
```
pip install psycopg2-binary
```


### collect static
```shell
python manage.py collectstatic
```

rm -rf */migrations/*


rm -rf CRM/migrations/* CRM/migrations/__pycache__
del orders\migrations\0004_auto_20250613_1948.py


### update api docs
python manage.py spectacular --color





###
find . -name "*.pyc" -delete

###
python manage.py help


ls core/management/commands/


python manage.py help | grep delete_tenant
python manage.py delete_tenant store1 --force




sudo snap install tree  
tree core/

# to show all url in projeact
python manage.py show_urls

# save url in text file