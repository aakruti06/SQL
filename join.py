import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="aakruti",
    password="akM@4225",
    database="python_project"
)

cursor = conn.cursor()

# ADD DEPARTMENT
def add_department():
    dept = input("Enter department name: ")
    cursor.execute("INSERT INTO dept(dept_name) VALUES (%s)", (dept,))
    conn.commit()
    print("Department added!")

# ADD EMPLOYEE
def add_employee():
    name = input("Enter name: ")
    salary = int(input("Enter salary: "))
    dept_id = int(input("Enter department ID: "))

    query = "INSERT INTO employee(name, salary, dept_id) VALUES (%s, %s, %s)"
    cursor.execute(query, (name, salary, dept_id))
    conn.commit()
    print("Employee added!")

# VIEW JOIN DATA
def view_all():
    query = """
    SELECT e.name, e.salary, d.dept_name
    FROM employee e
    JOIN dept d
    ON e.dept_id = d.dept_id
    """
    cursor.execute(query)
    for row in cursor.fetchall():
        print(row)

# FILTER BY DEPARTMENT
def by_department():
    dept = input("Enter department name: ")
    query = """
    SELECT e.name, e.salary, d.dept_name
    FROM employee e
    JOIN dept d
    ON e.dept_id = d.dept_id
    WHERE d.dept_name = %s
    """
    cursor.execute(query, (dept,))
    for row in cursor.fetchall():
        print(row)

# AVG SALARY PER DEPARTMENT
def avg_salary_dept():
    query = """
    SELECT d.dept_name, AVG(e.salary)
    FROM employee e
    JOIN dept d
    ON e.dept_id = d.dept_id
    GROUP BY d.dept_name
    """
    cursor.execute(query)
    for row in cursor.fetchall():
        print(row)

# MENU
while True:
    print("\n1. Add Department")
    print("2. Add Employee")
    print("3. View All (JOIN)")
    print("4. Employees by Department")
    print("5. Avg Salary per Department")
    print("6. Exit")

    choice = input("Enter choice: ")

    if choice == '1':
        add_department()
    elif choice == '2':
        add_employee()
    elif choice == '3':
        view_all()
    elif choice == '4':
        by_department()
    elif choice == '5':
        avg_salary_dept()
    elif choice == '6':
        print("Exiting...")
        break
    else:
        print("Invalid choice")

