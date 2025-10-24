import pandas as pd

file_path = "data1.csv"  # اسم الملف الأصلي

# ------------------- قراءة وتنظيف البيانات -------------------
df = pd.read_csv(file_path)

# دالة لتوحيد تنسيق الأكواد (تحول float إلى نص بدون .0 وتزيل الفراغات)
def normalize_code(x):
    try:
        return str(int(float(x))).strip()
    except:
        return str(x).strip()

df["code1"] = df["code1"].apply(normalize_code)
df["code2"] = df["code2"].apply(normalize_code)

# ------------------- إنشاء قاموس mapping -------------------
# هذا القاموس يربط كل code1 بقيمة cost1 الخاصة به
code_to_cost = df.set_index("code1")["cost1"].to_dict()

# ------------------- التحديث الذكي -------------------
# إذا كان code2 موجود ضمن code1 في أي صف، يتم تحديث cost2 بنفس cost1 من القاموس
df["cost2"] = df["code2"].apply(lambda c: code_to_cost.get(c, df.loc[df["code2"] == c, "cost2"].values[0] if (df["code2"] == c).any() else None))

# ------------------- حفظ النتيجة -------------------
df.to_csv("updated_data.csv", index=False)
print("✅ تم تحديث cost2 لجميع الصفوف التي يوجد لها code2 مطابق لأي code1.")
print("📄 تم حفظ الملف المحدث باسم updated_data.csv")
