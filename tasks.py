import mysql.connector

conn = mysql.connector.connect(
	host = "localhost",
	user = "aakruti",
	password = "akM@4225",
	database = "level2"
)

cursor = conn.cursor()
#------------------------------------------------------

def add_task():
	title = input("enter title: ")
	priority = input("enter priority (low/medium/high): ")
	status = input("enter status (pending/running/done): ")
	due_date = input("enter due date (YYYY-MM-DD or leave blank): ")

	if due_date == "":
		due_date = None

	query = """
	INSERT INTO tasks(title, priority, status, due_date)
	VALUES (%s, %s, %s, %s)
	"""

	cursor.execute(query, (title, priority, status, due_date))
	conn.commit()

	print("task added successfully! ")

#----------------------------------------------------------------------
def view_tasks():
	cursir.execute("SELECT * FROM tasks")
	
	rows = cursor.fetchall()

	print("\n ---- TASK LIST ----")
	for row in rows:
		print(row)

#----------------------------------------------------------------------
def update_task():
	task_id = int(input("enter task ID: "))
	status = input("enter new status: ")

	query = "UPDATE tasks SET status = %s WHERE id = %s"
	cursor.execute(query, (status, task_id))
	conn.commit()

	if cursor.rowcount > 0:
		print("task updated!")
	else:
		print("task not found!")

#------------------------------------------------------------------------
def delete_task():
	task_id = int(input("enter task ID: "))
	
	query = "DELETE FROM tasks WHERE id = %s"
	cursor.execute(query,(task_id,))
	conn.commit()
	
	if cursor.rowcount > 0:
		print("task delete!")
	else:
 		print("task not found!")

#--------------------------------------------------------------------------

def overdue_tasks():
    query = """
    SELECT id, title, due_date
    FROM tasks
    WHERE due_date < CURDATE()
    AND status != 'done'
    """

    cursor.execute(query)
    rows = cursor.fetchall()

    print("\n--- OVERDUE TASKS ---")

    if rows:
        for row in rows:
            print(row)
    else:
        print("No overdue tasks!")

# ---------------------------
# MENU
# ---------------------------
while True:
    print("\n===== TASK MANAGER =====")
    print("1. Add Task")
    print("2. View Tasks")
    print("3. Update Task")
    print("4. Delete Task")
    print("5. Overdue Tasks")
    print("6. Exit")

    choice = input("Enter choice: ")

    if choice == '1':
        add_task()
    elif choice == '2':
        view_tasks()
    elif choice == '3':
        update_task()
    elif choice == '4':
        delete_task()
    elif choice == '5':
        overdue_tasks()
    elif choice == '6':
        print("Exiting...")
        break
    else:
        print("Invalid choice")


