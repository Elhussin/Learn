import psycopg2
from psycopg2 import sql

# Admin connection (superuser)
admin_params = {
    "dbname": "postgres",
    "user": "postgres",
    "password": "3112",
    "host": "localhost",
    "port": "5432"
}

target_db = "summary"
target_user = "taha"
target_password = "3112"


def db_exists(cursor, db_name):
    cursor.execute("SELECT 1 FROM pg_database WHERE datname = %s", (db_name,))
    return cursor.fetchone() is not None


def user_exists(cursor, username):
    cursor.execute("SELECT 1 FROM pg_roles WHERE rolname = %s", (username,))
    return cursor.fetchone() is not None


def create_database(cursor, db_name):
    cursor.execute(sql.SQL("CREATE DATABASE {}").format(sql.Identifier(db_name)))
    print(f"✅ Database '{db_name}' created successfully.")


def create_user(cursor, username, password):
    cursor.execute(
        sql.SQL("CREATE USER {} WITH PASSWORD %s").format(sql.Identifier(username)),
        [password]
    )
    print(f"✅ User '{username}' created successfully.")


def grant_privileges(db_name, username):
    conn = psycopg2.connect(
        dbname=db_name,
        user="postgres",
        password="3112",
        host="localhost",
        port="5432"
    )
    conn.autocommit = True
    cursor = conn.cursor()

    cursor.execute(f"GRANT ALL PRIVILEGES ON SCHEMA public TO {username};")
    cursor.execute(f"GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO {username};")
    cursor.execute(f"GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO {username};")
    cursor.execute(f"ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO {username};")
    cursor.execute(f"ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO {username};")

    print(f"🔐 Privileges granted to '{username}' on database '{db_name}'.")

    cursor.close()
    conn.close()


def main():
    try:
        conn = psycopg2.connect(**admin_params)
        conn.autocommit = True
        cursor = conn.cursor()

        # 1️⃣ Create user if not exists
        if not user_exists(cursor, target_user):
            create_user(cursor, target_user, target_password)
        else:
            print(f"ℹ️ User '{target_user}' already exists.")

        # 2️⃣ Create DB if not exists
        if not db_exists(cursor, target_db):
            create_database(cursor, target_db)
        else:
            print(f"ℹ️ Database '{target_db}' already exists.")

        cursor.close()
        conn.close()

        # 3️⃣ Grant privileges (always executed)
        grant_privileges(target_db, target_user)

    except Exception as e:
        print("❌ Error:", e)


# Run
main()
