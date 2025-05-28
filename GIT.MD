# git
### git config
- git config --global user.email "hasin3112@gmail.com"
- git config --global user.name "Elhussin"

### git auth ssh 
```bash
ssh-keygen -t ed25519 -C "hasin3112@gmail.com" : creat SSH
~/.ssh/id_ed25519.pub 
ssh -T git@github.com  : confiarm its work

cat ~/.ssh/id_ed25519.pub : capy it
[git ssh](https://github.com/settings/ssh/new)
```
### Create new repo and remote it to github
1. create new repo on github
2. init repo local
```bash
git init
git add .
git commit -m "first commit"
# remote it to github
git remote add origin <url>
git branch -M main
git push -u origin main
```


### Clone repo
```shell
git clone <url>
```

### clone All Branch
```shell
git clone --mirror <url>
```

### Fetch current branch
```shell
git fetch origin <branch name>
```
### fetch All Branch
```shell
git fetch origin --all
```

### check repo status
```shell
git status
```

### add file
```shell
git add <file name>
git add . # add all file
```

### commit
```shell
git commit -m "message"
git commit -am "message" # add and commit in one step
```


### Send to remote the first time 
> after this no need to use ( --set-upstream origin main)
```shell
git push --set-upstream origin main
```
### Send to remote
```shell
git push origin <branch name>
```
### Send to remote All Branch
```shell
git push origin --all
```



### get remote
```shell
git remote -v
```
### fetch remote branch without merge it 
```shell
git fetch origin <branch name>
```
### Get from remote
```shell
git pull origin <branch name>
```

## Branch

### Check local branch 
```shell
git branch ""
```
### Check all branch local & remote
```shell
git branch -a
```

### checkout to another branch
```shell
git checkout <branch name>
```
### create new branch
```shell
git branch <branch name>
```
### checkout to another branch and create it
```shell
git checkout -b <branch name>
```
### change branch name
git branch -m <old-name> <new-name>

### rename current branch
git branch -m <new-name>

### git remot wit repo
```bash
git remote add origin "https://github.com/Elhussin/react.git"
```

### Creat New Branch 
```
 git branch  <branch name>
```

### checkout to another branch 
```
 git checkout  <branch name>
 ```

### check all branch local 
```
git branch  # local
git branch -a   # local & remote 
```

### Merge branch
```bash
git checkout main
git merge <branch name>
```

### check commit history 
```shell
git log
```
### reset to older commit
```bash
git reset --hard <commit>
# git reset --hard origin/master
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

* git remote -v : check remot 

### send jsx as props childern'''

# Git Commit message

```
<type>(optional scope): <short summary>

(optional body)

(optional footer)
```
### must populer command
```
feat(auth): add JWT authentication
fix(login): resolve crash when email is empty
docs(readme): update installation steps
refactor(api): simplify error handling
chore: update dependencies
test(user): add unit tests for user service
```

```feat	إضافة ميزة جديدة
fix	إصلاح خلل
docs	تحديث التوثيق فقط
style	تغييرات تنسيق (مثل الفراغات، وليس الكود نفسه)
refactor	تحسين الكود بدون تغيير السلوك
test	إضافة أو تعديل اختبارات
chore	أشياء أخرى (تحديث أدوات، إعدادات CI، إلخ)
```

### notes

* استخدم المضارع (e.g. add, fix) وليس الماضي.
* اجعل الرسالة قصيرة وواضحة (50 حرف كحد أقصى للعنوان).
* استخدم سطرًا ثانيًا فارغًا، ثم وصف تفصيلي إن لزم.
* لا تكتب "WIP" (work in progress) إلا مؤقتًا.


### Exmpeale
```
<type>(<scope>): <short summary>

# وصف تفصيلي (اختياري)
# سطر واحد أو أكثر يشرح التعديل بشكل أوسع، ولماذا تم.

# Tickets أو مراجع (اختياري)
# Closes #123 أو Related to #456
```
```
feat(auth): add login with Google support

Added OAuth2 integration with Google to allow users to log in using their Gmail accounts.
This helps improve user convenience and reduces login friction.

Closes #42
```

### tempalte 
```
type(scope): short summary

Optional detailed explanation of what and why.

Related issues: #...
```
### creat template
```
nano ~/.gitmessage.txt

git config --global commit.template ~/.gitmessage.txt

```
* Ctrl + O → O stands for Output (save)

* Ctrl + X → eXit

### open commit messag in editor
git config --global core.editor "code --wait"


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

* git remote -v : check remot 

### send jsx as props childern'''

# Git Commit message

```
<type>(optional scope): <short summary>

(optional body)

(optional footer)
```
### must populer command
```
feat(auth): add JWT authentication
fix(login): resolve crash when email is empty
docs(readme): update installation steps
refactor(api): simplify error handling
chore: update dependencies
test(user): add unit tests for user service
```

```feat	إضافة ميزة جديدة
fix	إصلاح خلل
docs	تحديث التوثيق فقط
style	تغييرات تنسيق (مثل الفراغات، وليس الكود نفسه)
refactor	تحسين الكود بدون تغيير السلوك
test	إضافة أو تعديل اختبارات
chore	أشياء أخرى (تحديث أدوات، إعدادات CI، إلخ)
```

### notes

* استخدم المضارع (e.g. add, fix) وليس الماضي.
* اجعل الرسالة قصيرة وواضحة (50 حرف كحد أقصى للعنوان).
* استخدم سطرًا ثانيًا فارغًا، ثم وصف تفصيلي إن لزم.
* لا تكتب "WIP" (work in progress) إلا مؤقتًا.


### Exmpeale
```
<type>(<scope>): <short summary>

# وصف تفصيلي (اختياري)
# سطر واحد أو أكثر يشرح التعديل بشكل أوسع، ولماذا تم.

# Tickets أو مراجع (اختياري)
# Closes #123 أو Related to #456
```
```
feat(auth): add login with Google support

Added OAuth2 integration with Google to allow users to log in using their Gmail accounts.
This helps improve user convenience and reduces login friction.

Closes #42
```

### tempalte 
```
type(scope): short summary

Optional detailed explanation of what and why.

Related issues: #...
```
### creat template
```
nano ~/.gitmessage.txt

git config --global commit.template ~/.gitmessage.txt

```
* Ctrl + O → O stands for Output (save)

* Ctrl + X → eXit

### open commit messag in editor
git config --global core.editor "code --wait"
