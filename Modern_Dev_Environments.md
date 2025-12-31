# Modern Development Environments Guide

A unified reference for managing Python and JavaScript development environments, covering modern tools (PDM, Bun, pnpm) and standard options (venv).

---

## 🐍 Python Environments

### 1. PDM (Recommended)
**Why?** Modern, supports lock files (`pdm.lock`), faster resolution, and simpler Docker integration compared to standard pip.

#### Installation
```bash
# Windows (PowerShell)
powershell -ExecutionPolicy ByPass -c "irm https://pdm-project.org/install-pdm.py | py -"

# Linux/Mac
curl -sSL https://pdm-project.org/install-pdm.py | python3 -

# via pip (Universal)
pip install pdm
```

#### Daily Usage
| Action | Command | Description |
| :--- | :--- | :--- |
| **Init Project** | `pdm init` | Starts a new project (creates pyproject.toml) |
| **Add Package** | `pdm add <pkg>` | installs & adds to minimal dependencies |
| **Add Dev Pkg** | `pdm add -d <pkg>` | Adds to dev dependencies (e.g., pytest, black) |
| **Import** | `pdm import requirements.txt` | Migrates from requirements.txt |
| **Lock** | `pdm lock` | Locks dependencies to specific versions |
| **Sync/Install**| `pdm install` | Installs dependencies from lock file |
| **Update** | `pdm update` | Updates dependencies |
| **Run** | `pdm run <cmd>` | Runs command in virtual env (e.g., `pdm run python manage.py`) |

#### Docker Best Practice
```dockerfile
FROM python:3.12-slim
WORKDIR /app

# Install PDM
RUN pip install pdm

# Copy dependency files first (caching layer)
COPY pyproject.toml pdm.lock ./
RUN pdm install --prod --no-editable

# Copy app code
COPY . .
CMD ["pdm", "run", "python", "main.py"]
```


### convert pdm.lock to requirements.txt without hashes

```bash
pdm export -f requirements --without-hashes > requirements.txt
```

### convert pdm.lock to requirements.txt with hashes

```bash
pdm export -f requirements > requirements.txt
```


---

### 2. venv (Standard)
**Why?** Built-in to Python. Best for quick scripts or when you cannot install external tools.

#### Setup & Activation
| OS | Create | Activate |
| :--- | :--- | :--- |
| **Windows** | `py -m venv venv` | `.\venv\Scripts\activate` |
| **Linux/Mac** | `python3 -m venv venv` | `source venv/bin/activate` |

> **Troubleshooting Windows Activation:**
> If you get a permission error, run:
> ```powershell
> Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
> ```

#### Managing Packages
*   **Install Requirements**: `pip install -r requirements.txt`
*   **Freeze Requirements**: `pip freeze > requirements.txt`
    *   *Fix encoding issues (Windows)*: `Get-Content requirements.txt | Set-Content -Encoding utf8 requirements-utf8.txt`
*   **Deactivate**: `deactivate`
*   **Delete Env**: `rmdir /s /q venv` (Windows) or `rm -rf venv` (Linux)

---

## ⚡ JavaScript / Node.js Environments

### 1. Bun (Ultra Fast)
**Why?** Everything-in-one (Runtime, Package Manager, Bundler). Extremely fast startup and install times.

#### Quick Start
```bash
# Install (Windows PowerShell)
powershell -c "irm bun.sh/install.ps1 | iex"

# Verify
bun -v
```

#### Common Commands
```bash
bun install             # Install dependencies
bun add <package>       # Add package
bun run dev             # Run dev script
bun run build           # Build project

bun run deploy          # Deploy project
```

---

### 2. pnpm (Disk Efficient)
**Why?** Uses hard links to save disk space (doesn't duplicate packages across projects). Faster than npm.

#### Usage
```bash
# Install Global
npm install -g pnpm

# Commands
pnpm install                 # Install dependnecies
pnpm add <package>           # Add package
pnpm add -D <package>        # Add dev package
pnpm run <script>            # Run script
pnpm dlx <pkg>               # Run temporary command (like npx)
```

Example Next.js setup:
```bash
pnpm dlx create-next-app@latest my-app --typescript

# Verify
pnpm -v
```


#### Docker Best Practice
```dockerfile
FROM node:18-alpine
WORKDIR /app

# Install pnpm
RUN npm install -g pnpm

# Copy dependency files first (caching layer)
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

# Copy app code
COPY . .
CMD ["pnpm", "run", "dev"]
```


## npm (Standard)
**Why?** Built-in to Node.js. Best for quick scripts or when you cannot install external tools. 

#### Usage
```bash
# Install Global
npm install -g npm

# Commands
npm install                 # Install dependnecies
npm add <package>           # Add package
npm add -D <package>        # Add dev package
npm run <script>            # Run script

```

Example Next.js setup:
```bash
npm dlx create-next-app@latest my-app --typescript

# Verify
npm -v
```

#### Docker Best Practice
```dockerfile
FROM node:18-alpine
WORKDIR /app

# Install npm
RUN npm install -g npm

# Copy dependency files first (caching layer)
COPY package.json package-lock.json ./
RUN npm install --frozen-lockfile

# Copy app code
COPY . .
CMD ["npm", "run", "dev"]
```
