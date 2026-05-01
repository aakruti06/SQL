import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="aakruti",
    password="akM@4225",
    database="python_project"
)

cursor = conn.cursor()

# ADD STUDENT
def add_student():
    name = input("Enter student name: ")
    cursor.execute("INSERT INTO st(name) VALUES (%s)", (name,))
    conn.commit()
    print("Student added!")

# ADD MARKS
def add_marks():
    st_id = int(input("Enter student ID: "))
    sub1 = int(input("Enter marks for subject 1: "))
    sub2 = int(input("Enter marks for subject 2: "))

    query = "INSERT INTO marks(st_id, sub1, sub2) VALUES (%s, %s, %s)"
    cursor.execute(query, (st_id, sub1, sub2))
    conn.commit()
    print("Marks added!")

# VIEW PERFORMANCE (JOIN)
def view_performance():
    query = """
    SELECT s.name, m.sub1, m.sub2
    FROM st s
    JOIN marks m
    ON s.st_id = m.st_id
    """
    cursor.execute(query)
    for row in cursor.fetchall():
        print(row)

# AVERAGE MARKS
def avg_marks():
    query = """
    SELECT s.name, (m.sub1 + m.sub2)/2 AS average
    FROM st s
    JOIN marks m
    ON s.st_id = m.st_id
    """
    cursor.execute(query)
    for row in cursor.fetchall():
        print(row)

# TOP STUDENT
def top_student():
    query = """
    SELECT s.name, (m.sub1 + m.sub2) AS total
    FROM st s
    JOIN marks m
    ON s.st_id = m.st_id
    ORDER BY total DESC
    LIMIT 1
    """
    cursor.execute(query)
    print(cursor.fetchone())

# MENU
while True:
    print("\n1. Add Student")
    print("2. Add Marks")
    print("3. View Performance")
    print("4. Average Marks")
    print("5. Top Student")
    print("6. Exit")

    choice = input("Enter choice: ")

    if choice == '1':
        add_student()
    elif choice == '2':
        add_marks()
    elif choice == '3':
        view_performance()
    elif choice == '4':
        avg_marks()
    elif choice == '5':
        top_student()
    elif choice == '6':
        break
    else:
        print("Invalid choice")
