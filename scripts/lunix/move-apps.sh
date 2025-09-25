#!/bin/bash

# Create apps folder if not exists
mkdir -p apps

# List of apps to move (edit as needed)
apps=("crm" "hrm" "sales" "prescriptions" "products")

for app in "${apps[@]}"; do
  if [ -d "$app" ]; then
    mv "$app" apps/
    echo "Moved $app to apps/"
  fi
done

# Update settings.py INSTALLED_APPS
sed -i "s/'crm'/'apps.crm'/g" core/settings.py
sed -i "s/'hrm'/'apps.hrm'/g" core/settings.py
sed -i "s/'sales'/'apps.sales'/g" core/settings.py
sed -i "s/'prescriptions'/'apps.prescriptions'/g" core/settings.py
sed -i "s/'products'/'apps.products'/g" core/settings.py

# Update imports across project
find . -name "*.py" -type f -exec sed -i \
    -e 's/from crm/from apps.crm/g' \
    -e 's/from hrm/from apps.hrm/g' \
    -e 's/from sales/from apps.sales/g' \
    -e 's/from prescriptions/from apps.prescriptions/g' \
    -e 's/from products/from apps.products/g' \
    -e 's/import crm/import apps.crm/g' \
    -e 's/import hrm/import apps.hrm/g' \
    -e 's/import sales/import apps.sales/g' \
    -e 's/import prescriptions/import apps.prescriptions/g' \
    -e 's/import products/import apps.products/g' {} +
