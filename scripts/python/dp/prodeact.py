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
    SELECT        dbo.v_ItemCardtaha.Code, dbo.v_ItemCardtaha.Description as name, SUM(dbo.v_ItemCardtaha.Incoming - dbo.v_ItemCardtaha.Outgoing) AS required_qty, dbo.Product.CostPrice as cost, dbo.Product.RetailPrice as retail
FROM            dbo.v_ItemCardtaha INNER JOIN
                         dbo.Product ON dbo.v_ItemCardtaha.Code = dbo.Product.Code
WHERE        (dbo.v_ItemCardtaha.DepName = N'Jeddah Store') AND (dbo.v_ItemCardtaha.MainGroupID = 38 OR
                         dbo.v_ItemCardtaha.MainGroupID = 58)
GROUP BY dbo.v_ItemCardtaha.Description, dbo.v_ItemCardtaha.Code, dbo.Product.RetailPrice, dbo.Product.CostPrice
HAVING        (SUM(dbo.v_ItemCardtaha.Incoming - dbo.v_ItemCardtaha.Outgoing) <> 0)
    """)

    rows = cursor.fetchall()
    for row in rows:
        print(row)
except pyodbc.Error as ex:
    sqlstate = ex.args[0]
    print(f"Error connecting to SQL Server: {sqlstate}")
    print(ex)
finally:
    if 'cnxn' in locals() and cnxn:
        cnxn.close()
        print("Connection closed.")



