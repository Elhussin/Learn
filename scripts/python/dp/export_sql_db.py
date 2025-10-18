
import pyodbc
from dotenv import load_dotenv
import os

# تحميل المتغيرات من ملف .env تلقائيًا
load_dotenv()  

server = os.getenv('SERVER')
database = os.getenv('DATABASE')
username = os.getenv('DBUSERNAME')
password = os.getenv('PASSWORD')
connection_string = (
    f'DRIVER={{ODBC Driver 17 for SQL Server}};'
    f'SERVER={server};'
    f'DATABASE={database};'
    f'UID={username};'
    f'PWD={password};'
    'Encrypt=no;'
    'TrustServerCertificate=yes;'
)

output_dir = "db_export"
os.makedirs(output_dir, exist_ok=True)

try:
    cnxn = pyodbc.connect(connection_string)
    cursor = cnxn.cursor()

    # === 1. الحصول على أسماء الجداول ===
    cursor.execute("""
        SELECT TABLE_NAME
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_TYPE = 'BASE TABLE';
    """)
    tables = [row.TABLE_NAME for row in cursor.fetchall()]

    db_structure = {}

    # === 2. إنشاء ملفات JSON + SQL لكل جدول ===
    for table in tables:
        cursor.execute(f"""
            SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE, CHARACTER_MAXIMUM_LENGTH
            FROM INFORMATION_SCHEMA.COLUMNS
            WHERE TABLE_NAME = '{table}';
        """)
        columns = cursor.fetchall()

        table_info = []
        create_lines = []
        for col in columns:
            col_name = col.COLUMN_NAME
            col_type = col.DATA_TYPE
            max_len = col.CHARACTER_MAXIMUM_LENGTH
            nullable = col.IS_NULLABLE

            # تحديد النوع مع الطول إن وجد
            if max_len and col_type in ("nvarchar", "varchar", "char"):
                col_type = f"{col_type}({max_len})"

            null_sql = "NULL" if nullable == "YES" else "NOT NULL"
            create_lines.append(f"    [{col_name}] {col_type} {null_sql},")

            table_info.append({
                "column": col_name,
                "type": col_type,
                "nullable": nullable
            })

        # إزالة الفاصلة الأخيرة
        if create_lines:
            create_lines[-1] = create_lines[-1].rstrip(',')

        # حفظ ملف SQL لكل جدول
        create_sql = f"CREATE TABLE [{table}] (\n" + "\n".join(create_lines) + "\n);\n"
        with open(os.path.join(output_dir, f"{table}.sql"), "w", encoding="utf-8") as f:
            f.write(create_sql)

        # حفظ ملف JSON لكل جدول
        with open(os.path.join(output_dir, f"{table}.json"), "w", encoding="utf-8") as f:
            json.dump(table_info, f, indent=4, ensure_ascii=False)

        db_structure[table] = table_info

    # === 3. العلاقات بين الجداول ===
    cursor.execute("""
        SELECT 
            fk.name AS FK_Name,
            tp.name AS Table_Name,
            cp.name AS Column_Name,
            tr.name AS Referenced_Table,
            cr.name AS Referenced_Column
        FROM sys.foreign_keys AS fk
        INNER JOIN sys.foreign_key_columns AS fkc 
            ON fkc.constraint_object_id = fk.object_id
        INNER JOIN sys.tables AS tp 
            ON fkc.parent_object_id = tp.object_id
        INNER JOIN sys.columns AS cp 
            ON fkc.parent_object_id = cp.object_id AND fkc.parent_column_id = cp.column_id
        INNER JOIN sys.tables AS tr 
            ON fkc.referenced_object_id = tr.object_id
        INNER JOIN sys.columns AS cr 
            ON fkc.referenced_object_id = cr.object_id AND fkc.referenced_column_id = cr.column_id
        ORDER BY tp.name;
    """)
    relations = cursor.fetchall()

    relation_lines = []
    for r in relations:
        rel_sql = (
            f"ALTER TABLE [{r.Table_Name}] "
            f"ADD CONSTRAINT [{r.FK_Name}] "
            f"FOREIGN KEY ([{r.Column_Name}]) "
            f"REFERENCES [{r.Referenced_Table}]([{r.Referenced_Column}]);"
        )
        relation_lines.append(rel_sql)

    with open(os.path.join(output_dir, "relations.sql"), "w", encoding="utf-8") as f:
        f.write("\n".join(relation_lines))

    # === 4. ملف ملخص عام ===
    with open(os.path.join(output_dir, "db_summary.txt"), "w", encoding="utf-8") as f:
        f.write(f"عدد الجداول: {len(tables)}\n\n")
        for t in tables:
            f.write(f"- {t} ({len(db_structure[t])} أعمدة)\n")

    # === 5. ملف JSON شامل لكل القاعدة ===
    with open(os.path.join(output_dir, "db_structure.json"), "w", encoding="utf-8") as f:
        json.dump(db_structure, f, indent=4, ensure_ascii=False)

    print(f"\n✅ تم إنشاء ملفات القاعدة في المجلد: {output_dir}")

except Exception as e:
    print("❌ خطأ أثناء التصدير:", e)

finally:
    if 'cnxn' in locals() and cnxn:
        cnxn.close()
        print("🔒 تم إغلاق الاتصال.")
