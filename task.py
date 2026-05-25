import mysql.connector

# DB CONNECTION
conn = mysql.connector.connect(
    host="localhost",
    user="aakruti",
    password="akM@4225",
    database="python_project"
)

cursor = conn.cursor()

# ---------------------------
# 1. ADD TASK
# ---------------------------
def add_task():
    title = input("Enter title: ")
    priority = input("Enter priority (low/medium/high): ")
    status = input("Enter status (pending/running/done): ")
    due_date = input("Enter due date (YYYY-MM-DD): ")

    query = """
    INSERT INTO tasks(title, priority, status, due_date)
    VALUES (%s, %s, %s, %s)
    """

    cursor.execute(query, (title, priority, status, due_date))
    conn.commit()
    print("Task added!")

# ---------------------------
# 2. VIEW TASKS
# ---------------------------
def view_tasks():
    cursor.execute("SELECT * FROM tasks")
    rows = cursor.fetchall()

    if rows:
        print("\nAll Tasks:")
        for row in rows:
            print(row)
    else:
        print("No tasks found")

# ---------------------------
# 3. UPDATE TASK
# ---------------------------
def update_task():
    task_id = int(input("Enter task ID to update: "))
    status = input("Enter new status: ")

    query = "UPDATE tasks SET status = %s WHERE id = %s"
    cursor.execute(query, (status, task_id))
    conn.commit()

    if cursor.rowcount:
        print("Task updated!")
    else:
        print("Task not found")

# ---------------------------
# 4. DELETE TASK
# ---------------------------
def delete_task():
    task_id = int(input("Enter task ID to delete: "))

    query = "DELETE FROM tasks WHERE id = %s"
    cursor.execute(query, (task_id,))
    conn.commit()

    if cursor.rowcount:
        print("Task deleted!")
    else:
        print("Task not found")

# ---------------------------
# 5. OVERDUE TASKS
# ---------------------------
def overdue_tasks():
    query = """
    SELECT id, title, due_date
    FROM tasks
    WHERE due_date < CURDATE()
    AND status != 'done'
    """

    cursor.execute(query)
    rows = cursor.fetchall()

    if rows:
        print("\nOverdue Tasks:")
        for row in rows:
            print(row)
    else:
        print("No overdue tasks")

# ---------------------------
# MENU
# ---------------------------
while True:
    print("\n----- TASK MANAGER -----")
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

#-----------------------------------------------------------------
