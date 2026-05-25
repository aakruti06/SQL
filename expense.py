import mysql.connector

conn = mysql.connector.connect(
	host = "localhost",
	user = "aakruti",
	password = "akM@4225",
	database = "level2"
)

cursor = conn.cursor()

#add expense

def add_expense():
	amount = int(input("Amount :"))
	category = input("Category :")
	desc = input("Description :")
	date = input("Date (YYYY-MM-DD): ")

	query = """
	INSERT INTO expense(amount, category, description, exp_date) VALUES (%s, %s, %s, %s)
	"""
	
	cursor.execute(query, (amount, category, desc, date))
	conn.commit()

	print("Expense added!")

#view expense

def view_expense():
	cursor.execute("SELECT * FROM expense")

	print("\n ---- ALL EXPENSES ---- ")
	for row in cursor.fetchall():
		print(row)

#update expense

def update_expense():
	id = int(input("Enter expense ID: "))
	amount = int(input("Enter new amount: "))
	
	query = "UPDATE expense SET amount = %s WHERE  id = %s"
	cursor.execute(query, (amount, id))
	conn.commit()

	if cursor.rowcount:
		print("Expense updated!")
	else:
		print("Expense not found!")

#delete expense

def delete_expense():
	id = int(input("Enter expense ID: "))

	query = "DELETE FROM  expense WHERE id = %s"
	cursor.execute(query,(id,))
	conn.commit()
		
	if cursor.rowcount:
		print("Expense deleted!")
	else:
		print("Expense not found!")


while True:
	print("\n ---- Expense Tracker ---- ")
	print("1. Add expense")
	print("2. View expense")
	print("3. Update expense")
	print("4. Delete expense")
	print("5. Exit")

	ch = input("Enter choice: ")
	
	if ch == '1':
		add_expense()
	elif ch == '2':
		view_expense()
	elif ch == '3':
		update_expense()
	elif ch == '4':
		delete_expense()
	elif ch == '5':
		print("Exit")
		break
	else:
		print("invalid choice")


