import pymysql
import cryptography


# Function to create a connection to the database
def create_connection():
    timeout = 10
    return pymysql.connect(
        charset="utf8mb4",
        connect_timeout=timeout,
        cursorclass=pymysql.cursors.DictCursor,
        db="",
        host="",
        password="",
        read_timeout=timeout,
        port=20215,
        user="",
        write_timeout=timeout,
    )


# Function to create a new record
def create_record(connection, class_number, students, class_teacher, sports):
    with connection.cursor() as cursor:
        query = "INSERT INTO `КЛАСИ` (`Клас`, `Учнів`, `Класний керівник`, `Займаються спортом`) VALUES (%s, %s, %s, %s)"
        cursor.execute(query, (class_number, students, class_teacher, sports))
    connection.commit()
    print("Record inserted successfully.")


# Function to read all records
def read_records(connection):
    with connection.cursor() as cursor:
        query = "SELECT * FROM `КЛАСИ`"
        cursor.execute(query)
        connection.commit()  # Commit the transaction
        for row in cursor.fetchall():
            print(row)


# Function to update a record
def update_record(connection, class_number, students, class_teacher, sports):
    with connection.cursor() as cursor:
        query = "UPDATE `КЛАСИ` SET `Учнів` = %s, `Класний керівник` = %s, `Займаються спортом` = %s WHERE `Клас` = %s"
        cursor.execute(query, (students, class_teacher, sports, class_number))
    connection.commit()
    print("Record updated successfully.")


# Function to delete a record
def delete_record(connection, class_number):
    with connection.cursor() as cursor:
        query = "DELETE FROM `КЛАСИ` WHERE `Клас` = %s"
        cursor.execute(query, (class_number,))
    connection.commit()
    print("Record deleted successfully.")


def main():
    connection = create_connection()

    # Predefined data
    predefined_data = [
        (1, 30, "Ivan Ivanov", 10),
        (2, 25, "Maria Petrova", 12),
        (3, 20, "Oleg Sidorov", 8)
    ]

    print("\nInserting predefined data...")
    for data in predefined_data:
        create_record(connection, *data)

    print("\nReading all records:")
    read_records(connection)

    print("\nUpdating record for class 1...")
    update_record(connection, 1, 32, "Ivan Ivanov", 12)

    print("\nReading all records after update:")
    read_records(connection)

    print("\nDeleting record for class 2...")
    delete_record(connection, 2)

    print("\nReading all records after deletion:")
    read_records(connection)

    connection.close()


if __name__ == "__main__":
    main()
