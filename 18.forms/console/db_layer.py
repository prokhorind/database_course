import psycopg2


DB_PARAMS = {
    "dbname": "",
    "user": "",
    "password": "",
    "host": "",
    "port": "5432"  # Зазвичай 5432
}

def get_connection():
    return psycopg2.connect(**DB_PARAMS)

def add_officer(name, badge_number):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("INSERT INTO Officers (name, badge_number) VALUES (%s, %s) RETURNING officer_id;", (name, badge_number))
    officer_id = cur.fetchone()[0]
    conn.commit()
    cur.close()
    conn.close()
    return officer_id

def get_all_officers():
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT * FROM Officers;")
    results = cur.fetchall()
    cur.close()
    conn.close()
    return results

def search_officers(term):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT * FROM Officers WHERE name ILIKE %s OR badge_number ILIKE %s;", (f"%{term}%", f"%{term}%"))
    results = cur.fetchall()
    cur.close()
    conn.close()
    return results

def update_officer(officer_id, name, badge_number):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("UPDATE Officers SET name = %s, badge_number = %s WHERE officer_id = %s;", (name, badge_number, officer_id))
    conn.commit()
    cur.close()
    conn.close()

def delete_officer(officer_id):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("DELETE FROM Officers WHERE officer_id = %s;", (officer_id,))
    conn.commit()
    cur.close()
    conn.close()
