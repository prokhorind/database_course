import logic_layer

def create_officer():
    name = input("Enter officer name: ")
    badge_number = input("Enter badge number: ")
    officer_id = logic_layer.create_officer_logic(name, badge_number)
    print(f"Officer added with ID: {officer_id}")

def read_officers():
    officers = logic_layer.read_officers_logic()
    for officer in officers:
        print(officer)

def search_officer():
    search_term = input("Enter officer name or badge number to search: ")
    officers = logic_layer.search_officer_logic(search_term)
    if officers:
        for officer in officers:
            print(officer)
    else:
        print("No matching officer found.")

def update_officer():
    officer_id = input("Enter officer ID to update: ")
    new_name = input("Enter new name: ")
    new_badge = input("Enter new badge number: ")
    logic_layer.update_officer_logic(officer_id, new_name, new_badge)
    print("Officer updated successfully.")

def delete_officer():
    officer_id = input("Enter officer ID to delete: ")
    logic_layer.delete_officer_logic(officer_id)
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
            print("Goodbye!")
            break
        else:
            print("Invalid choice. Try again.")

if __name__ == "__main__":
    menu()
