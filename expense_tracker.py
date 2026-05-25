import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="aakruti",
    password="akM@4225",
    database="level2"
)

cursor = conn.cursor()

# ---------------------------
# ADD EXPENSE
# ---------------------------
def add_expense():
    amount = int(input("Amount: "))
    category = input("Category: ")
    desc = input("Description: ")
    date = input("Date (YYYY-MM-DD): ")

    cursor.execute(
        "INSERT INTO expense(amount, category, description, exp_date) VALUES (%s,%s,%s,%s)",
        (amount, category, desc, date)
    )
    conn.commit()

    print("Expense added!")

    # Budget Check
    cursor.execute("SELECT limit_amount FROM budget WHERE category=%s", (category,))
    result = cursor.fetchone()

    if result:
        limit_amt = result[0]

        cursor.execute(
            "SELECT SUM(amount) FROM expense WHERE category=%s",
            (category,)
        )
        total = cursor.fetchone()[0]

        if total > limit_amt:
            print("⚠️ WARNING: Budget exceeded for", category)

# ---------------------------
# VIEW EXPENSES
# ---------------------------
def view_expenses():
    cursor.execute("SELECT * FROM expense")
    for row in cursor.fetchall():
        print(row)

# ---------------------------
# UPDATE EXPENSE
# ---------------------------
def update_expense():
    id = int(input("Enter ID: "))
    amount = int(input("New amount: "))

    cursor.execute("UPDATE expense SET amount=%s WHERE id=%s", (amount, id))
    conn.commit()

    print("Updated!")

# ---------------------------
# DELETE EXPENSE
# ---------------------------
def delete_expense():
    id = int(input("Enter ID: "))

    cursor.execute("DELETE FROM expense WHERE id=%s", (id,))
    conn.commit()

    print("Deleted!")

# ---------------------------
# MONTHLY SUMMARY
# ---------------------------
def monthly_summary():
    cursor.execute("""
        SELECT MONTH(exp_date), SUM(amount)
        FROM expense
        GROUP BY MONTH(exp_date)
    """)

    print("\nMonthly Summary:")
    for row in cursor.fetchall():
        print("Month:", row[0], "Total:", row[1])

# ---------------------------
# CATEGORY SUMMARY
# ---------------------------
def category_summary():
    cursor.execute("""
        SELECT category, SUM(amount)
        FROM expense
        GROUP BY category
    """)

    print("\nCategory Summary:")
    for row in cursor.fetchall():
        print(row)

# ---------------------------
# HIGHEST EXPENSE
# ---------------------------
def highest_expense():
    cursor.execute("SELECT * FROM expense ORDER BY amount DESC LIMIT 1")
    print(cursor.fetchone())

# ---------------------------
# BETWEEN DATES
# ---------------------------
def between_dates():
    start = input("Start date: ")
    end = input("End date: ")

    cursor.execute(
        "SELECT * FROM expense WHERE exp_date BETWEEN %s AND %s",
        (start, end)
    )

    for row in cursor.fetchall():
        print(row)

# ---------------------------
# SET BUDGET
# ---------------------------
def set_budget():
    cat = input("Category: ")
    limit = int(input("Limit: "))

    cursor.execute(
        "REPLACE INTO budget(category, limit_amount) VALUES (%s,%s)",
        (cat, limit)
    )
    conn.commit()

    print("Budget set!")

# ---------------------------
# MENU
# ---------------------------
while True:
    print("\n===== EXPENSE TRACKER =====")
    print("1. Add Expense")
    print("2. View Expenses")
    print("3. Update Expense")
    print("4. Delete Expense")
    print("5. Monthly Summary")
    print("6. Category Summary")
    print("7. Highest Expense")
    print("8. Between Dates")
    print("9. Set Budget")
    print("10. Exit")

    ch = input("Choice: ")

    if ch == '1':
        add_expense()
    elif ch == '2':
        view_expenses()
    elif ch == '3':
        update_expense()
    elif ch == '4':
        delete_expense()
    elif ch == '5':
        monthly_summary()
    elif ch == '6':
        category_summary()
    elif ch == '7':
        highest_expense()
    elif ch == '8':
        between_dates()
    elif ch == '9':
        set_budget()
    elif ch == '10':
        break
    else:
        print("Invalid choice")
