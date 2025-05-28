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

### createsuperuser 
```shell
python manage.py createsuperuser
```

### makemigrations
```shell
python manage.py makemigrations <app_name>
```
```shell
python manage.py migrate
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
