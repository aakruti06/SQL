import mysql.connector

# DB connection
conn = mysql.connector.connect(
    host="localhost",
    user="aakruti",
    password="akM@4225",
    database="python_project"
)

cursor = conn.cursor()

# ADD STUDENT
def add_student():
    name = input("Enter name: ")
    subject = input("Enter subject: ")
    marks = int(input("Enter marks: "))

    query = "INSERT INTO students(name, subject, marks) VALUES (%s, %s, %s)"
    cursor.execute(query, (name, subject, marks))
    conn.commit()
    print("Student added!")

# VIEW STUDENTS
def view_students():
    cursor.execute("SELECT * FROM students")
    for row in cursor.fetchall():
        print(row)

# TOPPER
def find_topper():
    cursor.execute("SELECT name, marks FROM students ORDER BY marks DESC LIMIT 1")
    result = cursor.fetchone()
    print("Topper:", result)

# AVERAGE MARKS
def average_marks():
    cursor.execute("SELECT AVG(marks) FROM students")
    avg = cursor.fetchone()
    print("Average Marks:", avg[0])

# PASS/FAIL
def pass_fail():
    cursor.execute("SELECT name, marks FROM students WHERE marks >= 50")
    print("Pass Students:")
    for row in cursor.fetchall():
        print(row)

    cursor.execute("SELECT name, marks FROM students WHERE marks < 50")
    print("Fail Students:")
    for row in cursor.fetchall():
        print(row)

# MENU
while True:
    print("\n1. Add Student")
    print("2. View Students")
    print("3. Find Topper")
    print("4. Average Marks")
    print("5. Pass/Fail List")
    print("6. Exit")

    choice = input("Enter choice: ")

    if choice == '1':
        add_student()
    elif choice == '2':
        view_students()
    elif choice == '3':
        find_topper()
    elif choice == '4':
        average_marks()
    elif choice == '5':
        pass_fail()
    elif choice == '6':
        print("Exiting...")
        break
    else:
        print("Invalid choice")
