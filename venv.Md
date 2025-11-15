
### install & activate virtual environment(venv)
```bash
sudo apt install python3.12-venv
python3 -m venv venv
source venv/bin/activate
```
l
```shell
py -m venv venv
venv\Scripts\activate
```git add
### If can not active
```shell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
```

### deactivate virtual environment
```shell
deactivate
```

### delete virtual environment
```shell
rmdir /s /q venv
```



### install requirements
```bash
pip install -r requirements.txt

```

### Create requirements file
```bash
pip freeze > requirements.txt
```
### unistall App
```bash
pip uninstall <appName>