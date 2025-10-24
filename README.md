# Library Management System (SQL Project)

## Project Overview
The **Library Management System** is a database project built using **SQL** that helps manage books, authors, library members, and borrow/return transactions efficiently.  
It simulates the operations of a real-world library — tracking books, due dates, fines, and stock availability.

This project demonstrates **data relationships, constraints, joins, and reporting queries** commonly used in relational database management.

---

## Features
- Manage books, authors, and library members  
- Record borrow and return transactions  
- Automatically calculate late return fines  
- View current book availability  
- Generate reports (most borrowed books, overdue items, etc.)  
- Demonstrates SQL joins, date functions, and constraints  

---

## Technologies Used
- **Database:** MySQL / PostgreSQL / SQLite  
- **Language:** SQL  
- **Concepts Demonstrated:**  
  - Primary and Foreign Keys  
  - Table Relationships (1-M, M-M)  
  - Aggregations & Group By  
  - Date Functions (`CURDATE()`, `DATEDIFF()`)  
  - Joins & Data Constraints  

---

## Database Schema

### Tables:
1. **Authors** – stores author details  
2. **Books** – stores book info, availability, and author linkage  
3. **Members** – stores member contact and membership data  
4. **Borrow** – manages book borrowing, due dates, and fines  

---

How to Run This Project
Open your MySQL Workbench, pgAdmin, or SQLite Studio.
Run the SQL script provided above step by step.
Insert the sample data.
Execute queries to view reports and results.

📈 Future Enhancements
Add stored procedures to handle borrow/return operations.
Implement triggers to auto-update book availability.
Integrate with Python (Streamlit / Flask) for GUI interface.
Add Admin and Member roles for access control.
