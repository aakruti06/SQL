import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="aakruti",
    password="akM@4225",
    database="python_project"
)

cursor = conn.cursor()

# ADD
def add_employee():
    name = input("Enter name: ")
    salary = int(input("Enter salary: "))
    dept = input("Enter department: ")

    query = "INSERT INTO employee(name, salary, department) VALUES (%s, %s, %s)"
    cursor.execute(query, (name, salary, dept))
    conn.commit()
    print("Employee added!")

# VIEW
def view_employees():
    cursor.execute("SELECT * FROM employee")
    for row in cursor.fetchall():
        print(row)

# HIGHEST SALARY
def highest_salary():
    cursor.execute("SELECT name, salary FROM employee ORDER BY salary DESC LIMIT 1")
    print("Highest:", cursor.fetchone())

# AVERAGE SALARY
def avg_salary():
    cursor.execute("SELECT AVG(salary) FROM employee")
    print("Average:", cursor.fetchone()[0])

# ABOVE AVERAGE
def above_average():
    cursor.execute("""
        SELECT name, salary 
        FROM employee 
        WHERE salary > (SELECT AVG(salary) FROM employee)
    """)
    print("Above Average:")
    for row in cursor.fetchall():
        print(row)

# SALARY RANGE
def salary_range():
    min_sal = int(input("Enter min salary: "))
    max_sal = int(input("Enter max salary: "))

    query = "SELECT name, salary FROM employee WHERE salary BETWEEN %s AND %s"
    cursor.execute(query, (min_sal, max_sal))
    for row in cursor.fetchall():
        print(row)

# MENU
while True:
    print("\n1. Add Employee")
    print("2. View Employees")
    print("3. Highest Salary")
    print("4. Average Salary")
    print("5. Above Average")
    print("6. Salary Range")
    print("7. Exit")

    choice = input("Enter choice: ")

    if choice == '1':
        add_employee()
    elif choice == '2':
        view_employees()
    elif choice == '3':
        highest_salary()
    elif choice == '4':
        avg_salary()
    elif choice == '5':
        above_average()
    elif choice == '6':
        salary_range()
    elif choice == '7':
        print("Exiting...")
        break
    else:
        print("Invalid choice")



