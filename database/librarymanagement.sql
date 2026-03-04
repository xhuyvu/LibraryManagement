-- Create database 
CREATE DATABASE IF NOT EXISTS LibraryManagement
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;

USE LibraryManagement;
-- create users
CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);
-- create category
CREATE TABLE categories(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(100) NOT NULL UNIQUE
);
-- create authors
CREATE TABLE authors(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- create books
CREATE TABLE books(
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    available_quantity INT NOT NULL,
    category_id INT NOT NULL,
	CONSTRAINT fk_books_category
        FOREIGN KEY (category_id)
        REFERENCES categories(id)
);
-- create book_authors
CREATE TABLE book_authors(
	book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY(book_id,author_id),
    CONSTRAINT fk_ba_book FOREIGN KEY(book_id) REFERENCES books(id) ON DELETE CASCADE,
    CONSTRAINT fk_ba_author FOREIGN KEY(author_id) REFERENCES authors(id)ON DELETE CASCADE
);
CREATE TABLE members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255),
    membership_date DATE NOT NULL,
    status ENUM('ACTIVE','INACTIVE') NOT NULL DEFAULT 'ACTIVE'
);
CREATE TABLE loans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    status ENUM('BORROWED','RETURNED','OVERDUE') 
        NOT NULL DEFAULT 'BORROWED',
    CONSTRAINT fk_loans_member FOREIGN KEY (member_id) REFERENCES members(id)
);
CREATE TABLE loan_details (
    loan_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (loan_id, book_id),
    CONSTRAINT fk_ld_loan FOREIGN KEY (loan_id) REFERENCES loans(id) ON DELETE CASCADE,
    CONSTRAINT fk_ld_book FOREIGN KEY (book_id) REFERENCES books(id)
);
CREATE TABLE fines (
    id INT AUTO_INCREMENT PRIMARY KEY,
    loan_id INT NOT NULL UNIQUE,
    amount DECIMAL(10,2) NOT NULL,
    paid BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_fines_loan FOREIGN KEY (loan_id) REFERENCES loans(id)
);
-- insert category 
INSERT INTO categories (name) VALUES
('Programming'),
('Database'),
('Web Development'),
('Software Engineering'),
('DevOps'),
('Data Science'),
('Networking'),
('Security');
-- insert user
INSERT INTO users (username, password) VALUES
('admin', '123456');
-- insert author
INSERT INTO authors (name) VALUES
('Robert C. Martin'),
('Joshua Bloch'),
('Martin Fowler'),
('Eric Evans'),
('Andrew Tanenbaum'),
('Donald Knuth'),
('Brian Kernighan'),
('Bjarne Stroustrup'),
('James Gosling'),
('Kent Beck'),
('Linus Torvalds'),
('Mark Lutz'),
('David Flanagan'),
('Michael Sipser'),
('Scott Chacon');
-- insert books
INSERT INTO books (title, quantity, available_quantity, category_id) VALUES
('Clean Code', 10, 10, 1),
('Effective Java', 8, 8, 1),
('Refactoring', 6, 6, 4),
('Domain Driven Design', 5, 5, 4),
('Design Patterns', 7, 7, 4),
('The Pragmatic Programmer', 9, 9, 1),
('Introduction to Algorithms', 12, 12, 1),
('Structure and Interpretation of Computer Programs', 4, 4, 1),
('Database System Concepts', 10, 10, 2),
('MySQL Cookbook', 6, 6, 2),
('Operating System Concepts', 7, 7, 1),
('Computer Networks', 8, 8, 7),
('Linux Kernel Development', 5, 5, 5),
('Docker Deep Dive', 10, 10, 5),
('Kubernetes in Action', 9, 9, 5),
('Python Crash Course', 15, 15, 1),
('JavaScript: The Good Parts', 8, 8, 3),
('You Don’t Know JS', 11, 11, 3),
('Data Science from Scratch', 6, 6, 6),
('Applied Cryptography', 5, 5, 8);
-- insert book_authors
INSERT INTO book_authors (book_id, author_id) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,3),
(6,7),
(7,6),
(8,6),
(9,5),
(10,5),
(11,5),
(12,5),
(13,11),
(14,11),
(15,11),
(16,14),
(17,13),
(18,13),
(19,14),
(20,15);
