#!/bin/bash

# دالة للتحقق من نجاح الأمر
check_status() {
    if [ $? -eq 0 ]; then
        echo "✅ $1 started successfully."
    else
        echo "❌ Failed to start $1."
        exit 1
    fi
}

echo "🚀 Starting All Docker Services..."

# 0. Create Shared Network
echo "--------------------------------------"
echo "🕸️  Ensuring Shared Network Exists..."
# Create network if it doesn't exist
docker network create osm_shared_network 2>/dev/null || echo "Network osm_shared_network already exists."

# 1. Start Optics Tenant (Creates optics volumes)
echo "--------------------------------------"
echo "� Starting Optics Tenant App..."
cd /home/go/deploy/optics_tenant || { echo "Directory not found: optics_tenant"; }
docker compose up -d
check_status "Optics Tenant"

# 2. Start Summary App (Creates summary volumes)
echo "--------------------------------------"
echo "📊 Starting Summary App..."
cd /home/go/deploy/summary || { echo "Directory not found: summary"; }
docker compose up -d
check_status "Summary App"

# 3. Start Gateway (Nginx) - NOW it can mount the existing volumes
echo "--------------------------------------"
echo "� Starting Gateway (Nginx)..."
cd /home/go/deploy/gateway || { echo "Directory not found: gateway"; }
docker compose up -d
check_status "Gateway"

# 4. Start Price List
echo "--------------------------------------"
echo "💰 Starting Price List App..."
cd /home/go/deploy/price-list || { echo "Directory not found: price-list"; }
docker compose up -d
check_status "Price List"

echo "--------------------------------------"
echo "🎉 All systems are up and running!"




# لتشغبل الملف
# chmod +x start_all_docker_apps.sh
# ./start_all_docker_apps.sh