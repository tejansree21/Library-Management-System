-- LIBRARY MANAGEMENT SYSTEM (SQL PROJECT)
-- Create Database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- 2️⃣ Create Tables

-- Table: Authors
CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(100) NOT NULL,
    nationality VARCHAR(50)
);

-- Table: Books
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    author_id INT,
    genre VARCHAR(50),
    publication_year INT,
    total_copies INT,
    available_copies INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Table: Members
CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    member_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    membership_date DATE
);

-- Table: Borrow
CREATE TABLE Borrow (
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    due_date DATE,
    fine DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- 3️⃣ Insert Sample Data
-- =========================================================

-- Authors
INSERT INTO Authors (author_name, nationality)
VALUES 
('J.K. Rowling', 'British'),
('George Orwell', 'British'),
('Harper Lee', 'American');

-- Books
INSERT INTO Books (title, author_id, genre, publication_year, total_copies, available_copies)
VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 'Fantasy', 1997, 10, 8),
('1984', 2, 'Dystopian', 1949, 6, 3),
('To Kill a Mockingbird', 3, 'Classic', 1960, 5, 4);

-- Members
INSERT INTO Members (member_name, email, phone, membership_date)
VALUES
('Rahul Sharma', 'rahul@gmail.com', '9876543210', '2024-02-10'),
('Sneha Kapoor', 'sneha@gmail.com', '9988776655', '2024-05-15');

-- Borrow Transactions
INSERT INTO Borrow (member_id, book_id, borrow_date, due_date, return_date, fine)
VALUES
(1, 1, '2025-09-25', '2025-10-10', NULL, 0),
(2, 2, '2025-09-20', '2025-10-05', '2025-10-09', 50);


-- 4️⃣ Example Queries and Reports
-- =========================================================

-- 🔹 List all books with author names
SELECT b.title, a.author_name, b.genre, b.publication_year
FROM Books b
JOIN Authors a ON b.author_id = a.author_id;

-- 🔹 Books currently borrowed
SELECT m.member_name, b.title, br.borrow_date, br.due_date
FROM Borrow br
JOIN Members m ON br.member_id = m.member_id
JOIN Books b ON br.book_id = b.book_id
WHERE br.return_date IS NULL;

-- 🔹 Books overdue and fines applicable
SELECT m.member_name, b.title, br.due_date, DATEDIFF(CURDATE(), br.due_date) AS days_overdue,
       (DATEDIFF(CURDATE(), br.due_date) * 10) AS fine_estimate
FROM Borrow br
JOIN Members m ON br.member_id = m.member_id
JOIN Books b ON br.book_id = b.book_id
WHERE br.return_date IS NULL AND br.due_date < CURDATE();

-- 🔹 Most borrowed books
SELECT b.title, COUNT(br.book_id) AS times_borrowed
FROM Borrow br
JOIN Books b ON br.book_id = b.book_id
GROUP BY b.title
ORDER BY times_borrowed DESC;

-- 🔹 Available stock of books
SELECT title, available_copies, total_copies
FROM Books;
