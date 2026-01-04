# 🧠 Git Cheat Sheet

## 📚 Index
- [🧠 Git Cheat Sheet](#-git-cheat-sheet)
  - [📚 Index](#-index)
  - [Installation](#installation)
    - [1. Install Git](#1-install-git)
      - [Windows](#windows)
      - [macOS](#macos)
      - [Linux](#linux)
    - [2. Create a GitHub Repository](#2-create-a-github-repository)
  - [Create \& Push New Repo](#create--push-new-repo)
  - [Git Config](#git-config)
  - [SSH Authentication](#ssh-authentication)
  - [Clone Repository](#clone-repository)
  - [Fetching](#fetching)
  - [Status \& Staging](#status--staging)
  - [Commit](#commit)
  - [Push to Remote](#push-to-remote)
  - [Remote Info](#remote-info)
  - [Pull from Remote](#pull-from-remote)
  - [Branch Management](#branch-management)
  - [Merging](#merging)
  - [Logs \& Reset](#logs--reset)
  - [Reset](#reset)
  - [Create Branch for Remote](#create-branch-for-remote)
  - [Stash](#stash)
  - [Rebase](#rebase)
  - [Tagging](#tagging)
  - [Commit Message Conventions](#commit-message-conventions)
    - [Common Types](#common-types)
    - [Guidelines](#guidelines)
    - [Commit Message Example](#commit-message-example)
  - [Open Commit Message in Editor](#open-commit-message-in-editor)
  - [Creat Commit Message Template](#creat-commit-message-template)
    - [tempalte example](#tempalte-example)
    - [creat template](#creat-template)
  - [remove cash](#remove-cash)
  - [remove all cash](#remove-all-cash)
  - [remove all cash and files](#remove-all-cash-and-files)
  - [remove all cash and files](#remove-all-cash-and-files-1)

---

## Installation

Step-by-step instructions on how to set up the project locally.

### 1. Install Git

#### Windows

1. Download the Git installer from the official website: [Git for Windows](https://git-scm.com/download/win).
2. Run the installer and follow the setup instructions.
3. To confirm the installation, open Command Prompt and type:
   ```sh
   git --version
   ```

#### macOS

1. Open Terminal.
2. Install Git using Homebrew:
   ```sh
   brew install git
   ```
3. To confirm the installation, type:
   ```sh
   git --version
   ```

#### Linux

1. Open Terminal.

2. Install Git using the package manager specific to your distribution:
   - Debian/Ubuntu:
     ```sh
     sudo apt-get update
     sudo apt-get install git
     ```
   - Fedora:
     ```sh
     sudo dnf install git
     ```
   - Arch Linux:
     ```sh
     sudo pacman -S git
     ```
3. To confirm the installation, type:
   ```sh
   git --version
   ```


### 2. Create a GitHub Repository

1. Sign in to [GitHub](https://github.com).
2. Click on the `+` icon in the top right corner and select `New repository`.
3. Fill in the repository name (e.g., `my-repo`).
4. Optionally, add a description.
5. Choose between Public or Private.
6. Optionally, initialize with a README file.
7. Click on `Create repository`.



## Create & Push New Repo

1. After create a new repo on GitHub
2. Initialize locally:

```bash
git init
git add .
git commit -m "first commit"
git remote add origin <url>
git branch -M main
git push -u origin main
```
## Git Config

```bash
git config --global user.email "<email>"
git config --global user.name "UserName"
```

## SSH Authentication

```bash
ssh-keygen -t ed25519 -C "hasin3112@gmail.com"  # Create SSH key
cat ~/.ssh/id_ed25519.pub                       # Copy key content
ssh -T git@github.com                           # Confirm it's working
```
<!-- يجب استخدامsshعند تحميل المستودع  -->
 git remote set-url origin git@github.com:Elhussin/optics_tenant.git
 git remote set-url origin  git@github.com:Elhussin/price-list.git
Add your SSH key to GitHub: [Add SSH Key](https://github.com/settings/ssh/new)

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

## Status & Staging

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
git branch -D <branch-name>          # Delete branch
```

## Merging

```bash
git checkout main
git merge <branch-name>
```

## Logs & Reset

```bash
git log                              # Show history
git log --oneline                    # Show history in one line
git reflog                           # Show reflog

```

## Reset

```bash
git reset --hard <commit>           # Reset to specific commit
git reset --hard origin/<branch-name> # Reset to remote branch
```

## Create Branch for Remote

```bash
git checkout -b <NEW-branch-name>  # create new branch
git push -u origin <NEW-branch-name> # push new branch to remote
```

##Delete Remote Branch

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

## Rebase

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

## Creat Commit Message Template

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

## remove cash
```bash
git rm --cached <file-name>
```

## remove all cash
```bash
git rm --cached .
```

## remove all cash and files
```bash
git rm --cached -r .
```
## remove all cash and files

```bash
rm -rf .git
```




<!-- This is a gitignore file template -->
# Modify this file as per your project requirements 
# Master important ignore patterns here
# =======================
# Python
# =======================
venv/
env/
ENV/
.venv/
*.pyc   
*.pyo
__pycache__/
*.py[cod]
*$py.class
*.so
.Python

# =======================
# Node / Frontend
# =======================
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*
.pnp
.pnp.*
.yarn/*
!.yarn/patches
!.yarn/plugins
!.yarn/releases
!.yarn/versions

# Next.js / Build
/.next/
/out/
/build
*.tsbuildinfo
next-env.d.ts

# =======================
# IDEs
# =======================
.vscode/
.idea/
*.swp
*.swo

# =======================
# OS
# =======================
.DS_Store
Thumbs.db

# =======================
# Logs & Cache
# =======================
*.log
.cache/
*.tmp

# =======================
# Environment files
# =======================
.env
.env.local
.env.*.local

# =======================
# Database
# =======================
*.db
*.sqlite
*.sqlite3

# =======================
# Migrations cache
# =======================
**/migrations/__pycache__/

# =======================
# Docker
# =======================
docker-compose.override.yml
