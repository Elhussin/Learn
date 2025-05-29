# Git Cheat Sheet

## Git Config
```bash
git config --global user.email "<email>"
git config --global user.name "UserName"
```

## SSH Authentication
```bash
ssh-keygen -t ed25519 -C "<email>"  # Create SSH key
cat ~/.ssh/id_ed25519.pub                       # Copy key content
ssh -T git@github.com                           # Confirm it's working
```
Add your SSH key to GitHub: [Add SSH Key](https://github.com/settings/ssh/new)

## Create New Repo and Push to GitHub
1. Create a new repo on GitHub
2. Initialize locally:
```bash
git init
git add .
git commit -m "first commit"
git remote add origin <url>
git branch -M main
git push -u origin main
```

## Clone Repository
```bash
git clone <url>
git clone --mirror <url>  # Clone all branches
```

## Fetching
```bash
git fetch origin <branch-name>     # Fetch specific branch
git fetch origin --all             # Fetch all branches
```

## Status and Staging
```bash
git status
git add <file-name>
git add .                          # Add all files
```

## Commit
```bash
git commit -m "message"
git commit -am "message"           # Add & commit in one step
```

## Push to Remote
```bash
git push --set-upstream origin main   # First time
git push origin <branch-name>
git push origin --all
```

## Remote Info
```bash
git remote -v                        # Check remote
git remote add origin <url>         # Add remote repo
```

## Pull from Remote
```bash
git pull origin <branch-name>
```

## Branch Management
```bash
git branch                           # Local branches
git branch -a                        # Local & remote branches
git checkout <branch-name>           # Switch branch
git branch <branch-name>             # Create branch
git checkout -b <branch-name>        # Create and switch
git branch -m <old> <new>            # Rename branch
git branch -m <new>                  # Rename current branch
git branch -d <branch-name>          # Delete branch
```

## Merging
```bash
git checkout main
git merge <branch-name>
```

## Logs and Reset
```bash
git log                              # Show history
git log --oneline                    # Show history in one line
git reflog                           # Show reflog
git reset --hard <commit>           # Reset to specific commit
```

## Reset to remote branch
```bash
git reset --hard origin/<branch-name>
```
## Create new branch for remote branch
```bash
git checkout -b <NEW-branch-name>  # create new branch
git push -u origin <NEW-branch-name> # push new branch to remote
```

## Delete Remote Branch
```bash
git push origin --delete <branch-name>
```


## Stash
```bash
git stash  # Save changes
git stash pop  # Apply changes
git stash list  # List stashes
git stash drop  # Drop stash
git stash clear  # Clear all stashes
```

## rebase
```bash
git rebase <branch-name> # rebase to branch
git rebase --continue # continue rebase
git rebase --abort # abort rebase
git rebase -i <commit> # interactive rebase
```

## Tagging
```bash
git tag <tag-name> # tag commit
git tag -a <tag-name> -m "message" # annotated tag
git tag -d <tag-name> # delete tag
git push origin <tag-name> # push tag
git push origin --tags # push all tags
git tag -d <tag-name> # delete tag
git push origin --delete <tag-name> # delete tag from remote
```

## Commit Message Conventions
```
<type>(scope): <short summary>

(optional body)

(optional footer)
```

### Common Types
- feat: إضافة ميزة جديدة
- fix: إصلاح خلل
- docs: توثيق فقط
- style: تغييرات تنسيقية
- refactor: تحسين الكود بدون تغيير السلوك
- test: إضافة أو تعديل اختبارات
- chore: أشياء أخرى (CI, أدوات)

### Guidelines
- استخدم المضارع: (e.g., add, fix)
- العنوان لا يتجاوز 50 حرفًا
- سطر ثانٍ فارغ قبل التفاصيل
- لا تكتب "WIP" إلا مؤقتًا

### Commit Message Example
```
feat(auth): add login with Google support

Added OAuth2 integration with Google to allow users to log in using their Gmail accounts.
This helps improve user convenience and reduces login friction.

Closes #42
```
## Open Commit Message in Editor
```bash
git config --global core.editor "<editorName> --wait"
```

## Creat Commit  Message Template

### tempalte example
```
type(scope): short summary

Optional detailed explanation of what and why.

Related issues: #...
```

### creat template
```bash
nano ~/.gitmessage.txt
git config --global commit.template ~/.gitmessage.txt
```

