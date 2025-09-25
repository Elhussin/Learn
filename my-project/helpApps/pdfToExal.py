import os
import pandas as pd
import tabula
import camelot
import pytesseract
from pdf2image import convert_from_path
from PIL import Image
import tkinter as tk
from tkinter import filedialog, messagebox, ttk

# مسار برنامج Tesseract (عدل المسار حسب جهازك)
pytesseract.pytesseract.tesseract_cmd = r"F:\PROJEAT\helpApps\tesseract-ocr.exe"

def extract_tables_pdf(pdf_path, output_excel, use_ocr=False):
    tables = []

    if not use_ocr:
        try:
            tables = tabula.read_pdf(pdf_path, pages='all', multiple_tables=True)
        except:
            tables = [t.df for t in camelot.read_pdf(pdf_path, pages='all')]

    else:
        images = convert_from_path(pdf_path)
        for page_num, img in enumerate(images, start=1):
            img_path = f"page_{page_num}.png"
            img.save(img_path, "PNG")
            text = pytesseract.image_to_string(Image.open(img_path), lang='eng')
            df = pd.DataFrame([line.split() for line in text.split("\n") if line.strip()])
            tables.append(df)
            os.remove(img_path)

    if not tables:
        messagebox.showerror("خطأ", "لم يتم العثور على جداول")
        return

    with pd.ExcelWriter(output_excel, engine='openpyxl') as writer:
        for i, table in enumerate(tables):
            table.to_excel(writer, sheet_name=f"Sheet{i+1}", index=False)

    messagebox.showinfo("نجاح", f"تم الحفظ في:\n{output_excel}")

# واجهة المستخدم
def browse_file():
    filename = filedialog.askopenfilename(filetypes=[("PDF files", "*.pdf")])
    if filename:
        file_path_var.set(filename)

def convert_pdf():
    pdf_path = file_path_var.get()
    if not pdf_path:
        messagebox.showwarning("تنبيه", "الرجاء اختيار ملف PDF")
        return

    output_excel = os.path.splitext(pdf_path)[0] + ".xlsx"
    use_ocr = ocr_var.get()

    extract_tables_pdf(pdf_path, output_excel, use_ocr)

# إنشاء نافذة
root = tk.Tk()
root.title("تحويل PDF إلى Excel")
root.geometry("500x200")

file_path_var = tk.StringVar()
ocr_var = tk.BooleanVar()

# عناصر الواجهة
frame = ttk.Frame(root, padding=20)
frame.pack(fill="both", expand=True)

ttk.Label(frame, text="ملف PDF:").grid(row=0, column=0, sticky="w")
ttk.Entry(frame, textvariable=file_path_var, width=40).grid(row=0, column=1)
ttk.Button(frame, text="استعراض", command=browse_file).grid(row=0, column=2, padx=5)

ttk.Checkbutton(frame, text="استخدام OCR (للملفات الممسوحة ضوئيًا)", variable=ocr_var).grid(row=1, column=0, columnspan=3, sticky="w", pady=10)

ttk.Button(frame, text="تحويل", command=convert_pdf).grid(row=2, column=0, columnspan=3, pady=10)

root.mainloop()
