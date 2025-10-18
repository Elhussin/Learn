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
    # remove_invalid_and_duplicates("vildet/validated_phones_remal.csv", output_path="unqe/unique_valid_numbers_remal.csv", phone_column="normalized_phone")
    # remove_invalid_and_duplicates("vildet/validated_phones_andals.csv", output_path="unqe/unique_valid_numbers_andals.csv", phone_column="normalized_phone")
    # remove_invalid_and_duplicates("vildet/validated_phones_azizi.csv", output_path="unqe/unique_valid_numbers_azizi.csv", phone_column="normalized_phone")
    # remove_invalid_and_duplicates("vildet/validated_phones_sulm.csv", output_path="unqe/unique_valid_numbers_sulm.csv", phone_column="normalized_phone")
    # remove_invalid_and_duplicates("vildet/validated_phones_60jed.csv", output_path="unqe/unique_valid_numbers_60jed.csv", phone_column="normalized_phone")
    # remove_invalid_and_duplicates("vildet/validated_phones_60mk.csv", output_path="unqe/unique_valid_numbers_60mk.csv", phone_column="normalized_phone")
    # remove_invalid_and_duplicates("vildet/validated_phones_arfat.csv", output_path="unqe/unique_valid_numbers_arfat.csv", phone_column="normalized_phone")
    # remove_invalid_and_duplicates("vildet/validated_phones_cu1.csv", output_path="unqe/unique_valid_numbers_cu1.csv", phone_column="normalized_phone")
    # remove_invalid_and_duplicates("vildet/validated_phones_madina.csv", output_path="unqe/unique_valid_numbers_madina.csv", phone_column="normalized_phone")
    # remove_invalid_and_duplicates("vildet/validated_phones_mans.csv", output_path="unqe/unique_valid_numbers_mans.csv", phone_column="normalized_phone")
    # remove_invalid_and_duplicates("vildet/validated_phones_nahk.csv", output_path="unqe/unique_valid_numbers_nahk.csv", phone_column="normalized_phone")
    # remove_invalid_and_duplicates("vildet/validated_phones_rpgh.csv", output_path="unqe/unique_valid_numbers_rpgh.csv", phone_column="normalized_phone")
    # remove_invalid_and_duplicates("vildet/validated_phones_lulu.csv", output_path="unqe/unique_valid_numbers_lulu.csv", phone_column="normalized_phone")
    # remove_invalid_and_duplicates("vildet/validated_phones_khazan.csv", output_path="unqe/unique_valid_numbers_khazan.csv", phone_column="normalized_phone")
    # remove_invalid_and_duplicates("vildet/validated_phones_tehly.csv", output_path="unqe/unique_valid_numbers_tehly.csv", phone_column="normalized_phone")
    # remove_invalid_and_duplicates("vildet/validated_phones_wazier.csv", output_path="unqe/unique_valid_numbers_wazier.csv", phone_column="normalized_phone")
    # remove_invalid_and_duplicates("vildet/validated_phones_yanbu.csv", output_path="unqe/unique_valid_numbers_yanbu.csv", phone_column="normalized_phone")

    # remove_invalid_and_duplicates("vildet/customerFinal.csv", output_path="unqe/unique_valid_numbers_customerFinal.csv", phone_column="normalized_phone")













# ✅ Finale File: unqe/unique_valid_numbers_remal.csv
# 📊 Before: 4594 | After: 3168
# ✅ Finale File: unqe/unique_valid_numbers_andals.csv
# 📊 Before: 10116 | After: 145
# ✅ Finale File: unqe/unique_valid_numbers_azizi.csv
# 📊 Before: 17651 | After: 98
# ✅ Finale File: unqe/unique_valid_numbers_sulm.csv
# 📊 Before: 26869 | After: 10841
# ✅ Finale File: unqe/unique_valid_numbers_60jed.csv
# 📊 Before: 30020 | After: 15927
# ✅ Finale File: unqe/unique_valid_numbers_60mk.csv
# 📊 Before: 14838 | After: 7967

# ✅ Finale File: unqe/unique_valid_numbers_arfat.csv
# 📊 Before: 22620 | After: 95
# ✅ Finale File: unqe/unique_valid_numbers_cu1.csv
# 📊 Before: 34260 | After: 13
# ✅ Finale File: unqe/unique_valid_numbers_madina.csv
# 📊 Before: 6065 | After: 3427

# ✅ Finale File: unqe/unique_valid_numbers_mans.csv
# 📊 Before: 2189 | After: 1301
# ✅ Finale File: unqe/unique_valid_numbers_nahk.csv
# 📊 Before: 36239 | After: 16579
# ✅ Finale File: unqe/unique_valid_numbers_rpgh.csv
# 📊 Before: 22137 | After: 91

# ✅ Finale File: unqe/unique_valid_numbers_lulu.csv
# 📊 Before: 5985 | After: 3
# ✅ Finale File: unqe/unique_valid_numbers_khazan.csv
# 📊 Before: 2282 | After: 1200
# ✅ Finale File: unqe/unique_valid_numbers_tehly.csv
# 📊 Before: 5955 | After: 2851
# ✅ Finale File: unqe/unique_valid_numbers_wazier.csv
# 📊 Before: 84 | After: 64
# ✅ Finale File: unqe/unique_valid_numbers_yanbu.csv
# 📊 Before: 8360 | After: 3268


# ✅ Finale File: unqe/unique_valid_numbers_customerFinal.csv
# 📊 Before: 365276 | After: 145140
