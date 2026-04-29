import mysql.connector

#DB connection

conn = mysql.connector.connect(
host = "localhost",
user = "aakruti",
password = "akM@4225",
database = "python_project"
)

cursor = conn.cursor()

#create

def add_employee():
	name = input("enter name: ")
	salary = int(input("enter  salary: ") or 0)
	manager_id = int(input("enter manager id: "))
	manager_id = int(manager_id) if manager_id else None

	query = "INSERT INTO employee(name,salary,manager_id) VALUES (%s, %s, %s)"
	cursor.execute(query, (name, salary, manager_id))
	conn.commit()
	print("employee added!")

#read

def view_employees():
	cursor.execute("SELECT * FROM employee")
	for row in cursor.fetchall():
		print(row)

#update

def update_salary():
	name = input("enter name: ")
	salary = int(input("enter new salary: "))

	query = "UPDATE employee SET salary = %s WHERE name = %s"
	cursor.execute(query,(salary,name))
	conn.commit()
	print("salary updated!")

#delete

def delete_employee():
	name = input("enter name: ")	
	query = "DELETE FROM employee WHERE name = %s"
	cursor.execute(query,(name,))
	conn.commit()
	print("employee deleted!")

#menu 
while True:
	print("\n1. Add Employee")
	print("2. View Employee")
	print("3. Update Salary")
	print("4. Delete Employee")
	print("5. Exit")


	choice = input("enter choice: ")

	if choice == '1':
		add_employee()

	elif choice == '2':
		view_employees()

	elif choice == '3':
		update_salary()

	elif choice == '4':
		delete_employee()

	elif choice == '5':
		print("exiting...")
		break

	else:
		print("invalid choice")


