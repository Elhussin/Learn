
import pandas as pd
import re

def normalize_phone_number(phone):
    """
    🔹 يحول رقم الجوال السعودي إلى الصيغة الدولية الموحدة +9665xxxxxxxx
    ويقبل الصيغ:
    - 05xxxxxxxx
    - 5xxxxxxxx أو 5xxxxxxxxx
    - 9665xxxxxxxx
    - +9665xxxxxxxx
    """
    if not phone or str(phone).strip() == "":
        return None

    phone = str(phone).strip().replace(" ", "").replace("-", "")
    phone = re.sub(r'\D', '', phone)

    # إصلاح الحالات الشائعة
    if phone.startswith("9665") and len(phone) == 12:
        phone = "0" + phone[3:]   # 9665xxxxxxxx → 05xxxxxxxx
    elif phone.startswith("+9665") and len(phone) == 13:
        phone = "0" + phone[4:]   # +9665xxxxxxxx → 05xxxxxxxx
    elif phone.startswith("5") and len(phone) == 9:
        phone = "0" + phone       # 5xxxxxxxx → 05xxxxxxxx
    elif phone.startswith("05") and len(phone) == 10:
        pass  # بالفعل صحيح
    else:
        return None

    # تحويل النهائي لصيغة +966
    if phone.startswith("05"):
        phone = "+966" + phone[1:]
    elif phone.startswith("5"):
        phone = "+966" + phone

    # تحقق نهائي
    pattern = re.compile(r'^\+9665\d{8}$')
    # return phone if pattern.match(phone) else None
    # pattern = re.compile(r'^05\d{8}$')
    return phone if pattern.match(phone) else None

def is_valid_phone_number(phone):
    if pd.isna(phone):
        return False
    return normalize_phone_number(phone) is not None


def validate_phone_numbers(csv_path, output_path="phone.csv", phone_column="phone"):
    df = pd.read_csv(csv_path)
    if phone_column not in df.columns:
        raise ValueError(f"❌ العمود '{phone_column}' غير موجود في الملف")

    df["normalized_phone"] = df[phone_column].apply(normalize_phone_number)
    df["is_valid"] = df["normalized_phone"].notna()
    df["validation_status"] = df["is_valid"].apply(lambda x: "صحيح" if x else "خطأ")
    df["valid_numbers"] = df.apply(lambda row: row["normalized_phone"] if row["is_valid"] else "", axis=1)
    df["invalid_numbers"] = df.apply(lambda row: row[phone_column] if not row["is_valid"] else "", axis=1)
    df.to_csv(output_path, index=False, encoding="utf-8-sig")

    print(f"✅ تم إنشاء الملف بنجاح: {output_path}")
    return df

if __name__ == "__main__":
    validate_phone_numbers("lastHussamCustomePhone2026.csv")
    # result_df = validate_phone_numbers("main/lastHussamCustomePhone2026.csv", output_path="vildet/validated_phones_remal.csv", phone_column="phone")