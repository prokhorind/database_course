from pymongo import MongoClient
from bson.objectid import ObjectId

uri = ""

# Connect to MongoDB
client = MongoClient(uri)  # or your Atlas connection string
db = client['crimes']
officers_collection = db['officers']


# Functions
def create_officer():
    name = input("Enter officer's name: ")
    badge_number = input("Enter officer's badge number: ")
    officer = {"name": name, "badge_number": badge_number}
    result = officers_collection.insert_one(officer)
    print(f"Officer created with ID: {result.inserted_id}")


def read_officers():
    officers = officers_collection.find()
    print("\n--- List of Officers ---")
    for officer in officers:
        print(f"ID: {officer['_id']}, Name: {officer['name']}, Badge Number: {officer['badge_number']}")
    print("-------------------------\n")


def update_officer():
    officer_id = input("Enter the ID of the officer to update: ")
    try:
        officer = officers_collection.find_one({"_id": ObjectId(officer_id)})
        if officer:
            new_name = input(f"Enter new name [{officer['name']}]: ") or officer['name']
            new_badge_number = input(f"Enter new badge number [{officer['badge_number']}]: ") or officer['badge_number']
            officers_collection.update_one(
                {"_id": ObjectId(officer_id)},
                {"$set": {"name": new_name, "badge_number": new_badge_number}}
            )
            print("Officer updated successfully.")
        else:
            print("Officer not found.")
    except Exception as e:
        print(f"Error: {e}")


def delete_officer():
    officer_id = input("Enter the ID of the officer to delete: ")
    try:
        result = officers_collection.delete_one({"_id": ObjectId(officer_id)})
        if result.deleted_count:
            print("Officer deleted successfully.")
        else:
            print("Officer not found.")
    except Exception as e:
        print(f"Error: {e}")


# Console App
def menu():
    while True:
        print("\n--- Officer Management Menu ---")
        print("1. Create Officer")
        print("2. View Officers")
        print("3. Update Officer")
        print("4. Delete Officer")
        print("5. Exit")
        choice = input("Select an option (1-5): ")

        if choice == '1':
            create_officer()
        elif choice == '2':
            read_officers()
        elif choice == '3':
            update_officer()
        elif choice == '4':
            delete_officer()
        elif choice == '5':
            print("Goodbye!")
            break
        else:
            print("Invalid choice. Please select 1-5.")


if __name__ == "__main__":
    menu()
