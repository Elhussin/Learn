
import pyodbc
from dotenv import load_dotenv
import os

# تحميل المتغيرات من ملف .env تلقائيًا
load_dotenv()  

server = os.getenv('SERVER')
database = os.getenv('DATABASE')
username = os.getenv('DBUSERNAME')
password = os.getenv('PASSWORD')

# إعداد الاتصال
connection_string = (
        f'DRIVER={{ODBC Driver 17 for SQL Server}};'
        f'SERVER={server};'
        f'DATABASE={database};'
        f'UID={username};'
        f'PWD={password};'
        'Encrypt=no;'  # غيّرها إلى yes لو السيرفر يتطلب اتصال مشفر
        'TrustServerCertificate=yes;'
)

try:
    cnxn = pyodbc.connect(connection_string)
    cursor = cnxn.cursor()
    cursor.execute("""
    SELECT TABLE_NAME
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_TYPE = 'BASE TABLE';
    """)

    tables = [row.TABLE_NAME for row in cursor.fetchall()]
    # print("📋 الجداول الموجودة:")
    # for t in tables:
    #     print("-", t)
    for table in tables:
        print(f"\n📁 table: {table}")
        cursor.execute(f"""
        SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_NAME = '{table}';
        """)
        for col in cursor.fetchall():

            print(f"  🔹 {col.COLUMN_NAME} ({col.DATA_TYPE})  Nullable: {col.IS_NULLABLE}")

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
    print("\n🔗 العلاقات بين الجداول:")
    for r in relations:
        print(f"{r.Table_Name}.{r.Column_Name} → {r.Referenced_Table}.{r.Referenced_Column}")


    import json

    db_structure = {}

    for table in tables:
        cursor.execute(f"""
        SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_NAME = '{table}';
        """)
        db_structure[table] = [
            {
                "column": col.COLUMN_NAME,
                "type": col.DATA_TYPE,
                "nullable": col.IS_NULLABLE
            } for col in cursor.fetchall()
        ]

    with open("db_structure.json", "w", encoding="utf-8") as f:
        json.dump(db_structure, f, indent=4, ensure_ascii=False)

    print("\n✅ تم حفظ بنية قاعدة البيانات في الملف db_structure.json")

    
except pyodbc.Error as ex:
    sqlstate = ex.args[0]
    print(f"Error connecting to SQL Server: {sqlstate}")
    print(ex)

finally:
    if 'cnxn' in locals() and cnxn:
        cnxn.close()
        print("Connection closed.")

