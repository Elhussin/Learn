#!/bin/bash

# دالة للتحديث الهادئ (تمنع استهلاك السيرفر بالكامل)
safe_deploy() {
    service_name=$1
    path=$2
    
    echo "=========================================="
    echo "🚀 Starting Safe Deploy for: $service_name"
    echo "=========================================="
    
    cd "$path" || exit
    
    # 1. سحب التحديثات
    echo "📥 Pulling latest code..."
    git pull
    
    # 2. البناء بأولوية منخفضة (Nice 19) ومعالج واحد
    # هذا يمنع عملية البناء من خنق السيرفر
    echo "🔨 Building newly (Low Priority)..."
    nice -n 19 docker-compose build --parallel
    
    # 3. تشغيل الحاويات الجديدة
    echo "🔄 Restarting containers..."
    docker-compose up -d
    
    echo "✅ Done with $service_name"
    echo "------------------------------------------"
}

# تحديث بوابة العبور أولاً (خفيفة)
safe_deploy "Gateway" "/home/hussin/code/doneAndUploud/gateway"

# تحديث التطبيقات واحداً تلو الآخر (وليس في نفس الوقت!)
safe_deploy "Summary App" "/home/hussin/code/doneAndUploud/summary"
safe_deploy "Price List" "/home/hussin/code/doneAndUploud/alyosseroptical-price-list"
safe_deploy "Optics Tenant" "/home/hussin/code/optics_tenant"

echo "🎉 All Systems Updated Successfully without killing the server!"
