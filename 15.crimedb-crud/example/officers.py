import psycopg2

# Database connection
conn = psycopg2.connect(
    dbname="your_database",
    user="your_user",
    password="your_password",
    host="localhost",
    port="5432"
)
cursor = conn.cursor()

def create_officer():
    name = input("Enter officer name: ")
    badge_number = input("Enter badge number: ")
    cursor.execute("INSERT INTO Officers (name, badge_number) VALUES (%s, %s) RETURNING officer_id;", (name, badge_number))
    conn.commit()
    print(f"Officer added with ID: {cursor.fetchone()[0]}")

def read_officers():
    cursor.execute("SELECT * FROM Officers;")
    officers = cursor.fetchall()
    for officer in officers:
        print(officer)

def search_officer():
    search_term = input("Enter officer name or badge number to search: ")
    cursor.execute("SELECT * FROM Officers WHERE name ILIKE %s OR badge_number ILIKE %s;", (f"%{search_term}%", f"%{search_term}%"))
    officers = cursor.fetchall()
    if officers:
        for officer in officers:
            print(officer)
    else:
        print("No matching officer found.")

def update_officer():
    officer_id = input("Enter officer ID to update: ")
    new_name = input("Enter new name: ")
    new_badge = input("Enter new badge number: ")
    cursor.execute("UPDATE Officers SET name = %s, badge_number = %s WHERE officer_id = %s;", (new_name, new_badge, officer_id))
    conn.commit()
    print("Officer updated successfully.")

def delete_officer():
    officer_id = input("Enter officer ID to delete: ")
    cursor.execute("DELETE FROM Officers WHERE officer_id = %s;", (officer_id,))
    conn.commit()
    print("Officer deleted successfully.")

def menu():
    while True:
        print("\nOfficer Management System")
        print("1. Add Officer")
        print("2. View Officers")
        print("3. Search Officer")
        print("4. Update Officer")
        print("5. Delete Officer")
        print("6. Exit")
        choice = input("Choose an option: ")

        if choice == '1':
            create_officer()
        elif choice == '2':
            read_officers()
        elif choice == '3':
            search_officer()
        elif choice == '4':
            update_officer()
        elif choice == '5':
            delete_officer()
        elif choice == '6':
            break
        else:
            print("Invalid choice. Try again.")

    cursor.close()
    conn.close()
    print("Goodbye!")

if __name__ == "__main__":
    menu()
