LIBRARY MANAGEMENT:-

create database LibraryDB;
use LibraryDB;

CREATE TABLE Books1 (
    id INT PRIMARY KEY, 
    title VARCHAR(100) NOT NULL, 
    author VARCHAR(50) NOT NULL, 
    published_year YEAR NOT NULL, 
    genre VARCHAR(30)
);
desc Books1;

CREATE TABLE Members1 (
    id INT  PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    membership_date DATE NOT NULL
);
desc Members1;

CREATE TABLE Borrowing1 (
    id INT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books1(id),
    FOREIGN KEY (member_id) REFERENCES Members1(id)
);
desc Borrowing1;

#INSERTING VALUES
 #Books
INSERT INTO Books1 (id, title, author, published_year, genre) VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Fiction'),
(2, 'To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction'),
(3, '1984', 'George Orwell', 1949, 'Dystopian'),
(4, 'Moby Dick', 'Herman Melville', 1901, 'Adventure');  
select * from Books1;

INSERT INTO Members1 (id,name, membership_date) VALUES
(1,'Alice Johnson', '2023-01-15'),
(2,'Bob Smith', '2022-11-20'),
(3,'Charlie Brown', '2023-05-10'),
(4,'David Williams', '2021-06-25');
select * from Members1;

INSERT INTO Borrowing1 (id, book_id, member_id, borrow_date, return_date) VALUES
(1, 1, 1, '2024-02-01', '2024-02-10'),
(2, 2, 2, '2024-02-03', '2024-02-10'),
(3, 3, 3, '2024-01-15', '2024-01-30'),
(4, 4, 4, '2024-02-05', '2024-02-10');
select * from Borrowing1;

SELECT 
    Borrowing1.id, 
    Members1.name AS member_name, 
    Books1.title AS book_title, 
    Borrowing1.borrow_date, 
    Borrowing1.return_date
FROM Borrowing1
JOIN Members1 ON Borrowing1.member_id = Members1.id
JOIN Books1 ON Borrowing1.book_id = Books1.id;

SELECT 
    Members1.name AS member_name, 
    COUNT(Borrowing1.book_id) AS books_borrowed
FROM Borrowing1
JOIN Members1 ON Borrowing1.member_id = Members1.id
GROUP BY Members1.name
ORDER BY books_borrowed DESC;










