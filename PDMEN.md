# PDM Quick Guide

A simple reference for installing and using **PDM** as a modern alternative to `pip` and `venv`.

---

## 🚀 Installation

You can install **PDM** using `pip`, `curl`, or PowerShell.

```bash
pip install pdm
```

Or:

```bash
curl -sSL https://pdm-project.org/install-pdm.py | python3 -
```

Or (PowerShell):

```powershell
powershell -ExecutionPolicy ByPass -c "irm https://pdm-project.org/install-pdm.py | py -"
```

Check version:

```bash
pdm --version
```

---

## 📁 Initialize Project

Start a new project:

```bash
pdm init
```

Show help:

```bash
pdm
```

---

## 📦 Managing Dependencies

### Import from `requirements.txt`

```bash
pdm import requirements.txt
```

### Add dependencies

```bash
pdm add <package-name>
```

Example:

```bash
pdm add django
```

### Add development dependencies

```bash
pdm add -dG dev <package-name>
```

Examples:

```bash
pdm add --dev pytest
pdm add --dev black
```

---

## 🔒 Lock & Update

Lock all dependencies:

```bash
pdm lock
```

Update all dependencies:

```bash
pdm update
```

---

## ▶️ Running Commands

Run Django or any Python command:

```bash
pdm run python manage.py runserver
pdm run python manage.py startapp <app-name>
```


## 🐳 Using PDM with Docker

### `Dockerfile`

```dockerfile
FROM python:3.12-slim
WORKDIR /app

# Install PDM
RUN pip install pdm

# Copy project files
COPY pyproject.toml pdm.lock ./
RUN pdm install --prod --no-editable

COPY . .

# Run the application
CMD ["pdm", "run", "python", "main.py"]
```