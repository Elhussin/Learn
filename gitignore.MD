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
