import tkinter as tk
from tkinter import messagebox
import logic_layer

root = tk.Tk()
root.title("Officer Management System")

def add_officer_ui():
    name = name_entry.get()
    badge = badge_entry.get()
    if name and badge:
        officer_id = logic_layer.create_officer_logic(name, badge)
        messagebox.showinfo("Success", f"Officer added with ID: {officer_id}")
        refresh_list()
    else:
        messagebox.showwarning("Input Error", "All fields required")

def refresh_list():
    officer_list.delete(0, tk.END)
    for officer in logic_layer.read_officers_logic():
        officer_list.insert(tk.END, officer)

def search_officer_ui():
    term = search_entry.get()
    results = logic_layer.search_officer_logic(term)
    officer_list.delete(0, tk.END)
    for officer in results:
        officer_list.insert(tk.END, officer)

def update_officer_ui():
    selected = officer_list.curselection()
    if not selected:
        messagebox.showwarning("Selection Error", "No officer selected")
        return
    officer = officer_list.get(selected[0])
    logic_layer.update_officer_logic(officer[0], name_entry.get(), badge_entry.get())
    messagebox.showinfo("Updated", "Officer updated")
    refresh_list()

def delete_officer_ui():
    selected = officer_list.curselection()
    if not selected:
        messagebox.showwarning("Selection Error", "No officer selected")
        return
    officer_id = officer_list.get(selected[0])[0]
    logic_layer.delete_officer_logic(officer_id)
    messagebox.showinfo("Deleted", "Officer deleted")
    refresh_list()

# --- UI Components ---
tk.Label(root, text="Name").grid(row=0, column=0)
tk.Label(root, text="Badge").grid(row=1, column=0)
tk.Label(root, text="Search").grid(row=0, column=2)

name_entry = tk.Entry(root)
badge_entry = tk.Entry(root)
search_entry = tk.Entry(root)

name_entry.grid(row=0, column=1)
badge_entry.grid(row=1, column=1)
search_entry.grid(row=0, column=3)

tk.Button(root, text="Add", command=add_officer_ui).grid(row=2, column=0)
tk.Button(root, text="Update", command=update_officer_ui).grid(row=2, column=1)
tk.Button(root, text="Delete", command=delete_officer_ui).grid(row=2, column=2)
tk.Button(root, text="Search", command=search_officer_ui).grid(row=0, column=4)

officer_list = tk.Listbox(root, width=60)
officer_list.grid(row=3, column=0, columnspan=5, pady=10)

refresh_list()
root.mainloop()
