import psycopg2

# Параметри підключення до бази даних
DB_PARAMS = {
    "dbname": "your_database",
    "user": "your_user",
    "password": "your_password",
    "host": "your_host",
    "port": "your_port"  # Зазвичай 5432
}

try:
    # Підключення до бази даних
    connection = psycopg2.connect(**DB_PARAMS)
    cursor = connection.cursor()

    # Створення таблиці
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS people (
            id SERIAL PRIMARY KEY,
            name TEXT NOT NULL,
            age INTEGER NOT NULL
        )
    """)
    connection.commit()

    # Введення даних користувачем
    name = input("Enter name: ")
    age = int(input("Enter age: "))

    cursor.execute("""
        INSERT INTO people (name, age) VALUES (%s, %s)
    """, (name, age))
    connection.commit()

    # Отримання даних
    cursor.execute("SELECT * FROM people")
    rows = cursor.fetchall()

    # Виведення конкретних полів
    for row in rows:
        print(f"ID: {row[0]}, Name: {row[1]}, Age: {row[2]}")
except psycopg2.DatabaseError as e:
    print(f"Database error: {e}")
    if connection:
        connection.rollback()
except Exception as e:
    print(f"Unexpected error: {e}")
    if connection:
        connection.rollback()
finally:
    if cursor:
        cursor.close()
    if connection:
        connection.close()