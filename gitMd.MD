GIT

<!--  -->
# ## git aut ssh
* 
* git config --global user.email "hasin3112@gmail.com"
* git config --global user.name "Elhussin"

* ssh-keygen -t ed25519 -C "hasin3112@gmail.com" : creat SSH
* ~/.ssh/id_ed25519.pub 
* ssh -T git@github.com  : confiarm its work

* cat ~/.ssh/id_ed25519.pub : capy it
* [git ssh](https://github.com/settings/ssh/new)


### clone
```shell
git clone "https://github.com/Yarob50/Tarmeez-React-Course.git"
```

### clone All Branch
```
git clone --mirror <Url>
```
### Fetch current branch
```shell
git fetch
```
### fetch All Branch
```shell
git fetch --all
```

### status
```shell
git status
```

### add
```shell
git add ""
```

### commit
```shell
git commit -m ""
```

### push
```shell
git push
```

### pull
```shell
git pull
```

### branch
```shell
git branch ""
```
### git all branch
```shell
git branch -a
```
### checkout
```shell
git checkout ""
```


### git config
```shell
git config --global user.name "Elhussin"
git config --global user.email "hasin3112@gmail.com"
```

git remote add origin <url>

### push
```shell
git push -u origin main
```


### change branch name
git branch -m <old-name> <new-name>
git branch -m  Main
### git remot wit repo
```bash
git remote add origin "https://github.com/Elhussin/react.git"
```

### Creat New Branch 
```
 git branch  <branch name>
```
### go to anothe branch 
```
 git checkout  <branch name>
 ```

### check all branch local 
```
git branch  # local
git branch -a   # local & remote 
```

### qit commit file 
```shell
git commit -a -m ""
```

### git log 
```shell
git log
```
### creat anoter branc in reomte  and push 
```
    git push --set-upstream origin <branch name>
```

### delate remote branch
```
git push origin --delete <branch name>
```

### git merge to branch 
```shell
git merge <branch name>

```
### merge to remot branch 