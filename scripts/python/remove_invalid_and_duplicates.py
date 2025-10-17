import pandas as pd

def remove_invalid_and_duplicates(csv_path, output_path="unique_valid_numbers.csv", phone_column="normalized_phone"):
    """
    🔹 يزيل الأرقام غير الصحيحة والمكررة
    - يحتفظ فقط بالأرقام الصحيحة (is_valid == True)
    - يحتفظ بأول تكرار لكل رقم هاتف
    """
    # قراءة الملف الناتج من مرحلة التحقق السابقة
    df = pd.read_csv(csv_path)

    # التحقق من الأعمدة المطلوبة
    if "is_valid" not in df.columns:
        raise ValueError("❌ الملف لا يحتوي على عمود 'is_valid'، تأكد أنك شغلت خطوة التحقق أولاً.")
    if phone_column not in df.columns:
        raise ValueError(f"❌ العمود '{phone_column}' غير موجود في الملف.")

    # تصفية الأرقام الصحيحة فقط
    valid_df = df[df["is_valid"] == True].copy()

    # إزالة التكرارات بناءً على رقم الهاتف (يحتفظ بأول صف فقط)
    unique_df = valid_df.drop_duplicates(subset=[phone_column], keep="first")

    # حفظ النتيجة
    unique_df.to_csv(output_path, index=False, encoding="utf-8-sig")
    print(f"✅ Finale File: {output_path}")
    print(f"📊 Before: {len(df)} | After: {len(unique_df)}")

    return unique_df

if __name__ == "__main__":
    remove_invalid_and_duplicates("validated_phones_remal.csv", output_path="unique_valid_numbers_remal.csv", phone_column="normalized_phone")
    remove_invalid_and_duplicates("validated_phones_andals.csv", output_path="unique_valid_numbers_andals.csv", phone_column="normalized_phone")
    remove_invalid_and_duplicates("validated_phones_azizi.csv", output_path="unique_valid_numbers_azizi.csv", phone_column="normalized_phone")
