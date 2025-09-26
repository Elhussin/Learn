# shell


### to cheack the file in direc
```ls```

### to go to the diraction
```cd <learnGit> ```

### to creat file then print some thing on it 
```echo "#Git" >>hello.html``` 
### to oben direact in new window  VS
```code .```
### to creat new file 
```code file.html```

### to open new trmnanl VS 
```shell
crt + shift +`
```

### to remove pyc file and __pycache__
```shell
Get-ChildItem -Recurse -Include *.pyc | Remove-Item
Get-ChildItem -Recurse -Directory -Include __pycache__ | Remove-Item -Recurse
```

### to remove migrations file
```shell
find . -path "*/migrations/*.py" -not -name "__init__.py" -delete
find . -path "*/migrations/*.pyc"  -delete
```



### to remove pyc file and __pycache__
```shell
find . -name "__pycache__" -type d -exec rm -r {} +  # (Linux/macOS)
Get-ChildItem -Path . -Recurse -Directory -Filter "__pycache__" | Remove-Item -Recurse -Force  # (Windows PowerShell)
```

### to remove migrations file
```shell
rm . "*/migrations/*.py" -not -name "__init__.py" -delete
rm . "*/migrations/*.pyc"  -delete
Get-ChildItem -Path . -Recurse -Directory -Filter "migrations" | Remove-Item -Recurse -Force 
```

rm -r */migrations/*.py
rm -r */migrations/*.pyc

### 2.Active 
```shell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

### 3. تعيين WSL 2 كإصدار الافتراضي
```shell
wsl --set-default-version 2

###معرفة نوع المعالج 64- 32
 wmic cpu get caption

###


### open port 
New-NetFirewallRule -DisplayName "Allow Port 8000" -Direction Inbound -Protocol TCP -LocalPort 8000 -Action Allow

### 
 netstat -ano | findstr :8000

 Set-NetFirewallRule -DisplayName "Allow Port 8000" -EdgeTraversalPolicy Allow

# chek domain
 nslookup optical-systeam.zapto.org

grep -rnw './src' -e 'toast('



# creat tree
#  tree > tree.txt
 tree /f /a > tree_output.txt

 tree -I 'node_modules|build|.git' > app_structure_filtered.txt

# create tree 
tree > tree.txt

# create tree file  in luinx
```bash
tree > tree.txt
```


#  creat requirements.txt
pip freeze > requirements.txt
