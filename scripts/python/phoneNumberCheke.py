import pandas as pd
import re

def normalize_phone_number(phone):
    """
    🔹 يحول أي رقم سعودي صحيح إلى الصيغة الدولية الموحدة +9665xxxxxxxx
    """
    phone = str(phone).strip().replace(" ", "")
    
    # إزالة أي بادئات غير ضرورية
    if phone.startswith("+966"):
        phone = phone
    elif phone.startswith("966"):
        phone = "+" + phone
    elif phone.startswith("05"):
        phone = "+966" + phone[1:]  # نحذف الـ0 ونضيف +966
    elif phone.startswith("5"):
        phone = "+966" + phone
    else:
        return None  # رقم غير معروف الشكل
    
    # بعد التحويل نتحقق مرة ثانية من صحة الرقم
    pattern = re.compile(r'^\+9665\d{8}$')
    return phone if pattern.match(phone) else None


def is_valid_phone_number(phone):
    """
    🔹 يتحقق من صحة رقم الجوال السعودي
    يقبل الأنماط:
    - 05xxxxxxxx
    - 5xxxxxxxx
    - 9665xxxxxxxx
    - +9665xxxxxxxx
    """
    if pd.isna(phone):
        return False

    phone = str(phone).strip().replace(" ", "")
    pattern = re.compile(r'^(?:\+9665|9665|05|5)\d{8}$')
    return bool(pattern.match(phone))


def validate_phone_numbers(csv_path, output_path="phone.csv", phone_column="phone"):
    # قراءة البيانات
    df = pd.read_csv(csv_path)

    if phone_column not in df.columns:
        raise ValueError(f"❌ العمود '{phone_column}' غير موجود في الملف")

    # التحقق والتحويل
    df["normalized_phone"] = df[phone_column].apply(normalize_phone_number)
    df["is_valid"] = df["normalized_phone"].notna()
    df["validation_status"] = df["is_valid"].apply(lambda x: "صحيح" if x else "خطأ")

    # أعمدة إضافية توضيحية
    df["valid_numbers"] = df.apply(lambda row: row["normalized_phone"] if row["is_valid"] else "", axis=1)
    df["invalid_numbers"] = df.apply(lambda row: row[phone_column] if not row["is_valid"] else "", axis=1)

    # حفظ الملف الجديد
    df.to_csv(output_path, index=False, encoding="utf-8-sig")
    print(f"✅ تم إنشاء الملف بنجاح: {output_path}")
    return df

if __name__ == "__main__":
    # validate_phone_numbers("phone.csv")
    result_df = validate_phone_numbers("remal.csv", output_path="validated_phones_remal.csv", phone_column="phone")
    result_df = validate_phone_numbers("andals.csv", output_path="validated_phones_andals.csv", phone_column="phone")
    result_df = validate_phone_numbers("azizi.csv", output_path="validated_phones_azizi.csv", phone_column="phone")
    # print(result_df.head())