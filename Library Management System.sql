
--------------Creating Database 'LibraryManagement_Books_sql' Using  'CREATE statement'---------------

CREATE DATABASE LibraryManagement_Books_sql;

----------------------------By Using "USE" statement We Select Database ----------------------------------------
use LibraryManagement_Books_sql;

--------------------------Creating Table Books By "CREATE statement"------------------------------------------
CREATE TABLE Books (
    book_id INT PRIMARY KEY ,
    title VARCHAR(100) NOT NULL,
    author_id INT NOT NULL,
    ISBN VARCHAR(20) NOT NULL,
    availability INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);


-- Insert 10 unique values into the "Books" By Each column---
INSERT INTO Books (book_id,title, author_id, ISBN, availability)
VALUES
    (101,'Title 1',1, 'ISBN1', 10),           
    (102,'Title 2',2, 'ISBN2', 20),
    (103,'Title 3',3, 'ISBN3', 15),
    (104,'Title 4',4, 'ISBN4', 5),
    (105,'Title 5',5, 'ISBN5', 30),
    (106,'Title 6',6, 'ISBN6', 25),
    (107,'Title 7',7, 'ISBN7', 8),
    (108,'Title 8',8, 'ISBN8', 12),
    (109,'Title 9',9, 'ISBN9', 18),
    (110,'Title 10',10, 'ISBN10', 22);
---------------------------------------------------------------------------------------------


--------------------------Creating Table Authors By "CREATE statement"------------------------------------------	
	CREATE TABLE Authors (
    author_id INT PRIMARY KEY ,
    author_name VARCHAR(100) NOT NULL,
    birthdate DATE,
    nationality VARCHAR(100)
);


-- Insert 10 unique values into the "Authors" By Each column---
INSERT INTO Authors (author_id,author_name, birthdate, nationality)
VALUES
    (1,'John ', '1980-05-15', 'American'),
    (2,'Brown', '1975-09-20', 'British'),
    (3,'Johnson', '1990-02-10', 'Canadian'),
    (4,'Michael', '1988-11-25', 'Spanish'),
    (5,'Kim', '1983-07-18', 'Korean'),
    (6,'Emma', '1972-03-30', 'Russian'),
    (7,'David', '1985-06-08', 'Chinese'),
    (8,'Lee', '1992-08-12', 'Mexican'),
    (9,'James', '1978-04-05', 'Irish'),
    (10,'Taylor', '1987-12-22', 'French');
------------------------------------------------------------------------------------------------


--------------------------Creating Table Patrons By "CREATE statement"------------------------------------------	
CREATE TABLE Patrons (
    patron_id INT PRIMARY KEY ,
    patron_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20)
);

-- Insert 10 unique values into the "Patrons" By Each column---
INSERT INTO Patrons (patron_id,patron_name, phone_number)
VALUES 
    (1,'Patron 1','123-456-7890'),
    (2,'Patron 2','234-567-8901'),
    (3,'Patron 3','345-678-9012'),
    (4,'Patron 4','456-789-0123'),
    (5,'Patron 5','567-890-1234'),
    (6,'Patron 6','678-901-2345'),
    (7,'Patron 7','789-012-3456'),
    (8,'Patron 8','890-123-4567'),
    (9,'Patron 9','901-234-5678'),
    (10,'Patron 10','012-345-6789');
--------------------------------------------------------------------------------------------------------

--------------------- Creating a table to track book borrowing and return history ----------------------
CREATE TABLE BorrowHistory (
    borrow_id INT PRIMARY KEY ,
    book_id INT,
    patron_id INT,
    borrowed_date DATE,
    returned_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (patron_id) REFERENCES Patrons(patron_id)
);

-- Insert 10 unique values into the "BorrowHistory" By Each column---
INSERT INTO BorrowHistory (borrow_id,book_id, patron_id, borrowed_date, returned_date)
VALUES 
    (11,101, 1, '2023-01-01', '2023-01-10'),
    (12,102, 2, '2023-01-05', '2023-02-15'),
    (13,103, 3, '2023-01-08', NULL),
    (14,104, 4, '2023-01-12', '2023-04-22'),
    (15,105, 5, '2023-01-15', '2023-05-25'),
    (16,106, 6, '2023-01-20', NULL), 
    (17,107, 7, '2023-01-22', '2023-05-25'),
    (18,108, 8, '2023-01-25', '2023-05-25'), 
    (19,109, 9, '2023-01-28', NULL), 
    (20,110, 10, '2023-01-30',NULL);

------------------------------------------------------------------------------------------------------
	SELECT * FROM Books;
    SELECT * FROM Authors;
	SELECT * FROM Patrons;
	SELECT * FROM BorrowHistory;
------------------------------------------------------------------------------------------------------
	--Implement SQL queries to add new books to the library, update book details, and mark books as 
    --borrowed or returned. 
------------------------------------------------------------------------------------------------------
---Adding New Books With The Help of 'INSERT Statement'----------------------------------------------- 
INSERT INTO Books (book_id,title, author_id, ISBN, availability)
VALUES (111,' Title 11', 1,'ISBN11', 1);

INSERT INTO Books (book_id,title, author_id, ISBN, availability)
VALUES (112,' Title 12', 5,'ISBN12', 16);

SELECT * FROM Books;

------------------------------------------------------------------------------------------------------
------------Updating Value in Row With The Help of 'UPDATE statement'---------------------------------
UPDATE Books
SET availability = 0
WHERE ISBN = 'ISBN11';

SELECT * FROM Books;

UPDATE Books
SET title = 'Title0'
WHERE book_id=101;

SELECT * FROM Books;

------------------------------------------------------------------------------------------------------
---Searching for Books by Title with The Help of 'SELECT' ,'WHERE' and 'LIKE' statement---------------
SELECT * FROM Books
WHERE title LIKE 'Title0';

SELECT * FROM Books;

------------------------------------------------------------------------------------------------------
---Searching for Books by Author with The Help of 'JOIN between two tables 'Books and Author'---------
SELECT B.*, A.author_name
FROM Books B JOIN Authors A
ON B.author_id = A.author_id
WHERE A.author_name = 'John';

SELECT B.*, A.author_name
FROM Books B JOIN Authors A
ON B.author_id = A.author_id
WHERE A.author_name = 'David';

------------------------------------------------------------------------------------------------------
--Searching for Books by ISBN
SELECT * FROM Books
WHERE ISBN = 'ISBN11';
------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------

------Here By Using 'JOIN' statement we create  queries to track book borrowing and return history----

----This Query is use to track all book borrowings---------------------------------
SELECT BorrowHistory.borrow_id,Books.title AS book_title,
    Authors.author_name AS author,Patrons.patron_name AS patron,
    BorrowHistory.borrowed_date,BorrowHistory.returned_date
FROM 
    BorrowHistory
JOIN 
    Books ON BorrowHistory.book_id = Books.book_id
JOIN 
    Authors ON Books.author_id = Authors.author_id
JOIN 
    Patrons ON BorrowHistory.patron_id = Patrons.patron_id;

------------------------------------------------------------------------------------------------------

--------This Query is use to track currently borrowed books-------------------------------------
SELECT 
    Books.title AS book_title,
    Authors.author_name AS author,
    Patrons.patron_name AS patron,
    BorrowHistory.borrowed_date
FROM 
    BorrowHistory
JOIN 
    Books ON BorrowHistory.book_id = Books.book_id
JOIN 
    Authors ON Books.author_id = Authors.author_id
JOIN 
    Patrons ON BorrowHistory.patron_id = Patrons.patron_id
WHERE 
    BorrowHistory.returned_date IS NULL;

----------------------------------------------------------------------------------------------------------

------This Query is use to track book borrowing history for a specific patron------------------------------
SELECT 
    Books.title AS book_title,
    Authors.author_name AS author,
    BorrowHistory.borrowed_date,
    BorrowHistory.returned_date
FROM 
    BorrowHistory
JOIN 
    Books ON BorrowHistory.book_id = Books.book_id
JOIN 
    Authors ON Books.author_id = Authors.author_id
WHERE 
    BorrowHistory.patron_id = patron_id;

-------------------------------------------------------------------------------------------------------

-- Implementing advanced SQL Server concepts such as window functions, common table expressions (CTEs),
--subqueries, the SELECT INTO statement, and the MERGE statement .

-------------------------------------------------------------------------------------------------------

----In this query we can use window functions 'RANK' to rank books based on their availability--------
SELECT title,availability,
    RANK() OVER (ORDER BY availability DESC) AS availability_rank
FROM Books;

------------------------------------------------------------------------------------------------------

----In this query we use a Common Table Expression (CTE) named "AvailableBooks"
----to filter out books that have an availability greater than 10.-------------------------------------
WITH AvailableBooks AS (SELECT title,ISBN,
        availability
    FROM Books
    WHERE 
        availability > 10
)
SELECT * FROM AvailableBooks
order by availability desc;

-------------------------------------------------------------------------------------------------------

-- this query selects the titles of author_id,author_name,nationality from the "Authors" table 
-- where the author's availability is 'availability >= 15'-----

SELECT author_id,author_name,nationality FROM Authors
WHERE 
    author_id IN (SELECT author_id FROM books WHERE availability >= 15);

-----------------------------------------------------------------------------
-- this query selects the titles of title from the "Books" table 
-- where the author's availability is 'nationality = 'Russian''-----
SELECT title FROM Books
WHERE 
    author_id IN (SELECT author_id FROM Authors WHERE nationality = 'Russian');


--------------------------------------------------------------------------------------------------------

--- In this query we use 'SELECT INTO' statement to creates a new table and 
--- inserts data from an existing table 'Books' based on a condition that the availability is greater than 10.
SELECT book_id,title,author_id,ISBN,availability
INTO 
    NewBooks FROM Books
WHERE 
    availability > 10;

SELECT * FROM NewBooks;
--------------------------------------------------------------------------------------------------------------

--By using 'SELECT INTO' statement to select data from the Books table and insert it into the BookRatings table,
--By applying the rating criteria.
SELECT book_id,
    CASE
        WHEN availability >= 20 THEN 1
        WHEN availability >= 15 THEN 2
        WHEN availability >= 5 THEN 3
        ELSE NULL 
    END AS rating_value
INTO BookRatings
FROM
    Books;      
---------------------------------------------------------------------------------------------------------

--In this query we use 'MERGE' statement to merge the "Books" table with the data in the "NewBooks" table,
--updating availability for existing books and inserting new books.
MERGE INTO Books AS target
USING NewBooks AS source
ON target.book_id = source.book_id
WHEN MATCHED THEN
    UPDATE SET target.availability = source.availability
WHEN NOT MATCHED BY TARGET THEN
    INSERT (title, author_id, ISBN, availability)
    VALUES (source.title, source.author_id, source.ISBN, source.availability);

----------------------------------------------------------------------------------------------------------
--By using CTE we Identifying Top-rated Books by Each Author--

--By using CTE we design a query to ranks books by their ratings (assuming ratings are available in another table)
--within each author group,providing library administrators with insights into the most popular books by each author.
WITH RankedBooks AS (
    SELECT b.title,b.author_id,b.ISBN,b.availability,r.rating_value,
        ROW_NUMBER() OVER (PARTITION BY b.author_id ORDER BY r.rating_value ) AS rating_rank
    FROM 
        Books b
    INNER JOIN BookRatings r ON b.book_id = r.book_id
)
SELECT 
    rb.title,
    a.author_name,
	rb.availability,
    rb.rating_value
FROM 
    RankedBooks rb
INNER JOIN Authors a ON rb.author_id = a.author_id
WHERE 
    rating_rank = 1;

---------------------------------------------------------------------------------------------------------------


--1)This project aimed to create a database schema for a library management system,
--allowing the tracking of books, authors, patrons, and borrowing history.
--2)The schema includes four main tables: Books, Authors, Patrons, and BorrowHistory,
--each have their specific purpose in managing library operations.
--3)The Books table stores details of each book,including title, author ID, ISBN, and availability.
--It serves as the central repository for book information in the library.
--4)The Authors table contains information about authors, including their name, birthdate, and nationality.
--5)The Patrons table stores details of library patrons, including their name and phone number.
--It facilitates the management of library members and their interactions with the library system.
--6)The BorrowHistory table tracks the borrowing and return history of books by patrons.
--It records the book ID, patron ID, borrowed date, and returned date for each transaction.

--In this project we implemented various SQL queries to perform various operations on the database,
--such as adding new books, updating book details, searching for books by title, author, or ISBN,
--and tracking book borrowing history.
--The queries such as basic SQL statements, including INSERT, UPDATE, SELECT, and JOIN,
--as well as advanced concepts such as window functions, common table expressions (CTEs), and the MERGE statement.

--This project provides a foundation for managing library operations efficiently using a relational database system.
--It allows library administrators to maintain accurate records of books, authors, patrons, and borrowing history,
--enabling effective library management and providing valuable insights into library usage patterns.













	


