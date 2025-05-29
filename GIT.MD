

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
