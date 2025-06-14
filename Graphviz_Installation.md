# Graphviz Installation Guide

1. Download Graphviz from: https://graphviz.org/download/
2. Run the installer and follow the installation steps
3. Add Graphviz to your system PATH:
   - Open System Properties (Right-click on This PC -> Properties)
   - Click on "Advanced system settings"
   - Click on "Environment Variables"
   - Under System variables, find and select "Path"
   - Click "Edit"
   - Click "New"
   - Add the path to Graphviz's bin directory (typically something like `C:\Program Files\Graphviz\bin`)
   - Click "OK" on all windows

After installation, restart your terminal and try running the command again:

```bash
python manage.py graph_models -a -o my_project_erd.png
```
