# practice program - phone and contacts

import mysql.connector

#db connection
conn = mysql.connector.connect(
	host = "localhost",
	user = "aakruti",
	password = "akM@4225",
	database = "python_project"
)

cursor = conn.cursor()

#add phone
def add_phone():
	num = int(input("Enter phone code: "))
	cursor.execute("INSERT INTO phone(self_num) VALUES (%s)", (num,))
	conn.commit()
	print("phone added")

#add contact
def add_contacts():
	name = input("Enter name: ")
	num = int(input("Enter number: "))
	self_num = int(input("Enter phone code: "))
		
	query = "INSERT INTO contacts(name, num, self_num) VALUES (%s, %s, %s)"
	cursor.execute(query, (name, num, self_num))
	conn.commit()
	print("contact added")

#view contacts
def view_contacts():
	query = """
	SELECT c.name, c.num, p.self_num
	FROM phone p
	JOIN contacts c
	ON p.self_num = c.self_num
	"""
	cursor.execute(query)
	for row in cursor.fetchall():
		print(row)

#count contacts by phone id
def count_contacts():
	pid = int(input("Enter phone id: "))

	query = """
	SELECT COUNT(*)
	FROM phone p
	JOIN contacts c
	ON p.self_num = c.self_num
	WHERE p.id = %s
	"""

	cursor.execute(query, (pid,))
	print("Total contacts: ",cursor.fetchone()[0])

#filter contacts by phone code
def filter_contacts():
	code = int(input("Enter phone code: "))

	query = """
	SELECT name, num
	FROM contacts
	WHERE self_num = %s
	"""
	cursor.execute(query,(code,))
	for row in cursor.fetchall():
		print(row)


#update contact
def update_contact():
	name = input("Enter name to update: ")
	new_num = int(input("Enter new number: "))

	query = """
	UPDATE contacts
	SET num = %s
	WHERE name = %s
	"""
	cursor.execute(query,(new_num,name))
	conn.commit()

	print("Contact updated ")

#delete contact
def delete_contact():
	name = input("Enter name to delete: ")
	
	query = "DELETE FROM contacts WHERE name = %s"
	cursor.execute(query,(name,))
	conn.commit()

	print("Contact deleted ")

#search by name
def search():
	name = input("Enter name to search: ")
	
	query =  """
	SELECT name 
	FROM contacts
	WHERE name = %s
	"""
	cursor.execute(query,(name,))
	result = cursor.fetchall()

	if result:
		for row in result:
			print(row)
	else:
		print("No contact found")
	
#	print("Found ")


while True:
	print("\n1. Add phone: ")
	print("2. Add contacts ")
	print("3. View contacts ")
	print("4. Count contacts by phone id ")
	print("5. Fliter by phone code ")
	print("6. Update contact ")
	print("7. Delete contact ")
	print("8. Search by name ")
	print("9. Exit ")

	choice = input("Enter choice: ")
	if choice == '1':
		add_phone()
	elif choice == '2':
		add_contacts()
	elif choice == '3':
		view_contacts()
	elif choice == '4':
		count_contacts()
	elif choice == '5':
		filter_contacts()
	elif choice == '6':
		update_contact()
	elif choice == '7':
		delete_contact()
	elif choice == '8':
		search()
	elif choice == '9':
		print("Exit...")
		break
	else:
		print("Invalid choice")



