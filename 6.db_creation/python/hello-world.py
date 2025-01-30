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

    # Створення таблиці (розкоментуйте, якщо потрібно створити)
    cursor.execute("CREATE TABLE mytest (id SERIAL PRIMARY KEY)")

    # Вставка даних
    cursor.execute("INSERT INTO mytest (id) VALUES (%s), (%s)", (1, 2))
    connection.commit()  # Фіксація транзакції

    # Отримання даних
    cursor.execute("SELECT * FROM mytest")
    print(cursor.fetchall())
except psycopg2.DatabaseError as e:
    print(f"Database error: {e}")
    if connection:
        connection.rollback()
except Exception as e:
    print(f"Unexpected error: {e}")
    if connection:
        connection.rollback()
finally:
    cursor.close()
    connection.close()