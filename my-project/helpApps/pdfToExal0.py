import os
import pandas as pd
import tabula
import camelot
import pytesseract
from pdf2image import convert_from_path
from PIL import Image

# مسار برنامج Tesseract في ويندوز (عدّل المسار حسب جهازك)
pytesseract.pytesseract.tesseract_cmd =  r"F:\PROJEAT\helpApps\tesseract-ocr.exe"

def extract_tables_pdf(pdf_path, output_excel="output.xlsx", use_ocr=False):
    tables = []

    if not use_ocr:
        try:
            print("📄 محاولة الاستخراج باستخدام Tabula...")
            tables = tabula.read_pdf(pdf_path, pages='all', multiple_tables=True)
        except:
            print("⚠️ Tabula فشلت، سيتم استخدام Camelot.")
            tables = [t.df for t in camelot.read_pdf(pdf_path, pages='all')]

    else:
        print("🔍 تفعيل OCR...")
        images = convert_from_path(pdf_path)
        for page_num, img in enumerate(images, start=1):
            img_path = f"page_{page_num}.png"
            img.save(img_path, "PNG")
            text = pytesseract.image_to_string(Image.open(img_path), lang='eng')
            df = pd.DataFrame([line.split() for line in text.split("\n") if line.strip()])
            tables.append(df)
            os.remove(img_path)

    if not tables:
        print("❌ لم يتم العثور على جداول.")
        return

    # حفظ كل جدول في شيت منفصل داخل Excel
    with pd.ExcelWriter(output_excel, engine='openpyxl') as writer:
        for i, table in enumerate(tables):
            table.to_excel(writer, sheet_name=f"Sheet{i+1}", index=False)

    print(f"✅ تم الحفظ بنجاح في: {output_excel}")

# 🔹 مثال على التشغيل
# استخراج عادي (ملف PDF نصي)
extract_tables_pdf("25VE002760.pdf", "25VE002760.xlsx", use_ocr=False)

# استخراج مع OCR (ملف PDF عبارة عن صور)
# extract_tables_pdf("25VE002760.pdf", "25VE002760.xlsx", use_ocr=True)
