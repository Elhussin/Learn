import pyodbc

source_conn = pyodbc.connect("DRIVER={ODBC Driver 17 for SQL Server};SERVER=IP_بعيد;DATABASE=RemoteDB;UID=user;PWD=pass")
dest_conn = pyodbc.connect("DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost;DATABASE=MyLocalDB;UID=localuser;PWD=localpass")

source_cursor = source_conn.cursor()
dest_cursor = dest_conn.cursor()

tables = ["Customers", "Orders"]  # جداول للنسخ

for table in tables:
    source_cursor.execute(f"SELECT * FROM {table}")
    rows = source_cursor.fetchall()
    if rows:
        columns = [desc[0] for desc in source_cursor.description]
        placeholders = ",".join("?" for _ in columns)
        insert_sql = f"INSERT INTO {table} ({', '.join(columns)}) VALUES ({placeholders})"
        dest_cursor.fast_executemany = True
        dest_cursor.executemany(insert_sql, [tuple(row) for row in rows])
        dest_conn.commit()

source_conn.close()
dest_conn.close()
print("✅ تم نسخ البيانات محليًا")
