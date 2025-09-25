# create_tree.ps1
# سكريبت لإنشاء مجلدات وملفات بناءً على قائمة

# اسم ملف القائمة (عدل لو اسم الملف مختلف)
$treeFile = ".\tree.txt"

# قراءة كل سطر من الملف
Get-Content $treeFile | ForEach-Object {
    $line = $_.Trim()

    # تجاهل الأسطر الفارغة
    if ($line -ne "") {

        # إذا السطر يحتوي نقطة → نفترض إنه ملف
        if ($line -match "\.") {
            # إنشاء الملف إذا مش موجود
            if (-not (Test-Path $line)) {
                New-Item -ItemType File -Force -Path $line | Out-Null
                Write-Host "File created: $line"
            }
        } else {
            # إنشاء المجلد إذا مش موجود
            if (-not (Test-Path $line)) {
                New-Item -ItemType Directory -Force -Path $line | Out-Null
                Write-Host "Directory created: $line"
            }
        }
    }
}


# .\create_tree.ps1