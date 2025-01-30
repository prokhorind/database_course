import psycopg2
from psycopg2 import OperationalError, Error



DB_PARAMS = {
    "dbname": "your_database",
    "user": "your_user",
    "password": "your_password",
    "host": "your_host",
    "port": "your_port"  # Зазвичай 5432
}

try:
    # Параметри підключення до бази даних
    conn = psycopg2.connect(**DB_PARAMS)

    # Створюємо курсор для виконання запитів
    cur = conn.cursor()

    # Отримуємо ім'я користувача з клавіатури
    name_to_search = input("Введіть ім'я для пошуку: ")

    # SQL запит для пошуку людини за іменем
    cur.execute("SELECT * FROM public.people WHERE name = %s", (name_to_search,))

    # Отримуємо результат
    records = cur.fetchall()

    # Перевіряємо, чи знайдено записи, і виводимо результат
    if records:
        print("Знайдені записи:")
        # Ітеруємо по кожному запису, виводимо значення за ім'ям стовпця
        for record in records:
            print(f"ID: {record[0]}, Ім'я: {record[1]}, Вік: {record[2]}")
    else:
        print("Записів з таким ім'ям не знайдено.")

except OperationalError as e:
    print("Помилка підключення до бази даних:", e)
except Error as e:
    print("Помилка при виконанні SQL-запиту:", e)
except Exception as e:
    print("Сталася непередбачена помилка:", e)
finally:
    # Закриваємо курсор і підключення, якщо вони були створені
    try:
        if cur:
            cur.close()
        if conn:
            conn.close()
    except NameError:
        pass  # Якщо підключення не було встановлено, нічого не робимо
