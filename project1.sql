-----------------Creating Database By Using Create statement---------------
CREATE DATABASE InventoryManagement_Products_sql;

----------------------------By Using "USE" statement We Select Database ----------------------------------------
use InventoryManagement_Products_sql;

--------------------------Creating Table Products By "CREATE statement"------------------------------------------
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    description VARCHAR(255),
    price int,
    quantity_in_stock INT,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

--------Inserting Values For Each Columns And Rows By "INSERT statement"--------------------------
INSERT INTO Products (product_id,product_name, description, price, quantity_in_stock,supplier_id)
VALUES 
    (101,'Laptop', '15.6-inch laptop with Intel Core i5 processor', 800, 15,1),
    (102,'Tablet', '10-inch tablet with touchscreen display', 250, 25,2),
    (103,'Printer', 'Wireless all-in-one printer with scanning and copying', 150, 10,3),
    (104,'Smartphone', '5.5-inch smartphone with dual-camera setup', 500, 40,4),
    (105,'External Hard Drive', '1TB external hard drive ', 80, 50,5),
    (106,'Wireless Router', 'Dual-band wireless router ', 130, 20,6),
    (107,'Gaming Console', 'Next-gen gaming console with 4K HDR support', 500, 10,7),
    (108,'Fitness Tracker', 'Waterproof fitness tracker', 80, 30,8),
    (109,'Bluetooth Speaker', 'Portable Bluetooth speaker ', 60, 60,9),
    (110,'Smartwatch', 'Smartwatch with OLED display', 200, 20,10);

--------------------Creating Table Suppliers By "CREATE statement"-----------------------
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(255),
    contact_name VARCHAR(255),
    contact_phone VARCHAR(20),
);

--------Inserting Values For Each Columns And Rows By "INSERT statement"--------------------------
INSERT INTO Suppliers (supplier_id, supplier_name, contact_name, contact_phone)
VALUES
    (1, 'Supplier 1', 'John ',  '123-456-7890'),
    (2, 'Supplier 2', 'Jane', '987-654-3210'),
    (3, 'Supplier 3', 'Alice','111-222-3333'),
    (4, 'Supplier 4', 'Bob','444-555-6666'),
    (5, 'Supplier 5', 'Mary','777-888-9999'),
    (6, 'Supplier 6', 'David','222-333-4444'),
    (7, 'Supplier 7', 'Emily','555-666-7777'),
    (8, 'Supplier 8', 'Michael','888-999-0000'),
    (9, 'Supplier 9', 'Sarah','333-444-5555'),
    (10, 'Supplier 10','Chris','000-111-2222');

--------------------Creating Table Inventory_Transactions By "CREATE statement"-----------------------
CREATE TABLE Inventory_Transactions (
    transaction_id INT PRIMARY KEY,
    transaction_type VARCHAR(50) NOT NULL,
    product_id INT NOT NULL,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

--------Inserting Values For Each Columns And Rows By "INSERT FUNCTION"--------------------------
INSERT INTO Inventory_Transactions (transaction_id, transaction_type, product_id, quantity)
VALUES
    (1, 'purchase', 101, 10),
    (2, 'sale', 102, 5),
    (3, 'purchase', 103, 20),
    (4, 'sale', 101, 8),
    (5, 'sale', 103, 10),
    (6, 'purchase', 102, 15),
    (7, 'sale', 104, 12),
    (8, 'purchase', 104, 25),
    (9, 'purchase', 105, 30),
    (10, 'sale', 105, 18);

---------------By Using "SELECT statement" With "*" We Can Display All Retrieve Data---------------
SELECT * FROM Products;
SELECT * FROM Suppliers;
SELECT * FROM Inventory_Transactions;
------------------------------------------------------------------------------------------------------------------

----Implement SQL queries to insert, update, and delete records in these tables.--------------------

------------------------------------------------------------------------------------------------------------------
-- Inserting a new product into the Products table by using "INSERT statement"
INSERT INTO Products (product_id, product_name, description, price, quantity_in_stock, supplier_id)
VALUES (111, 'Airpods', 'Bluetooth Earbuds with 24H Playtime', 1000, 10, 11);

INSERT INTO Products (product_id, product_name, description, price, quantity_in_stock, supplier_id)
VALUES (112, 'Smart TV', 'Bluetooth Earbuds with 24H Playtime', 2000, 5, 12);

SELECT * FROM Products;
------------------------------------------------------------------------------------------------------------
-- Inserting a new supplier into the Suppliers table by using "INSERT statement"
INSERT INTO Suppliers (supplier_id, supplier_name, contact_name, contact_phone)
VALUES (11, 'Supplier 11', 'Alex', '999-888-7777');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_name, contact_phone)
VALUES (12, 'Supplier 12', 'Justin', '543-768-9479');

SELECT * FROM Suppliers;
------------------------------------------------------------------------------------------------------------
-- Inserting a new inventory transaction by using "INSERT statement"
INSERT INTO Inventory_Transactions (transaction_id, transaction_type, product_id, quantity)
VALUES (11, 'sale', 112, 8);

INSERT INTO Inventory_Transactions (transaction_id, transaction_type, product_id, quantity)
VALUES (12, 'purchase', 111, 3);

SELECT * FROM Inventory_Transactions;
----------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------
-- Updating the description of a product in products table by "UPDATE statement"
UPDATE Products
SET description = '55-inch with 4K resolution'
WHERE product_id = 112;

SELECT * FROM Products;
---------------------------------------------------------------------------------------------
-- Updating the price of a product in products table by "UPDATE statement"
UPDATE Products
SET price = 900
WHERE product_id = 104;

SELECT * FROM Products;
---------------------------------------------------------------------------------------------
-- Updating the contact phone of a supplier by "UPDATE statement"
UPDATE Suppliers
SET contact_phone = '111-222-3333'
WHERE supplier_id = 12;

SELECT * FROM Suppliers;
---------------------------------------------------------------------------------------------
-- Updating the contact phone of a supplier by "UPDATE statement"
UPDATE Suppliers
SET contact_name = 'Rony'
WHERE supplier_id = 9;

SELECT * FROM Suppliers;
----------------------------------------------------------------------------------------------
-- Updating the quantity of an inventory transaction by "UPDATE statement"
UPDATE Inventory_Transactions
SET quantity = 20
WHERE transaction_id = 11;

SELECT * FROM Inventory_Transactions;
----------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------
-- Deleting a product_id from the Products table by "DELETE statement"
DELETE FROM Products
WHERE product_id = 111;

SELECT * FROM Products;

--------------------------------------------------------------------------------------------------------------------
-- Deleting a supplier_name from the Suppliers table by "DELETE statement"
DELETE FROM Suppliers
WHERE supplier_name = 'supplier 11';

SELECT * FROM Suppliers;

-------------------------------------------------------------------------------------------------------------------
-- Deleting a quantity from the inventory transaction table by "DELETE statement"
DELETE FROM Inventory_Transactions
WHERE  quantity= 8;

SELECT * FROM Inventory_Transactions;

------------------------------------------------------------------------------------------------------------

--Write SQL queries to retrieve and display product information, supplier details, and inventory levels.

------------------------------------------------------------------------------------------------------------
--Retrieve (show) product information with supplier details with the help of "JOIN statement"---
SELECT P.product_id,P.product_name,P.description,P.price,P.quantity_in_stock,S.supplier_name,S.contact_name,
    S.contact_phone
FROM 
    Products AS P
JOIN 
    Suppliers AS S ON P.supplier_id = S.supplier_id;
--In this query we joins the Products table with the Suppliers table
--using the supplier_id foreign key relationship and show relevant columns from both tables.

------------------------------------------------------------------------------------------------------------
--Retrieve inventory levels(quantity) for each product by joining products table with Inventory_Transactions table:
SELECT P.product_id,P.product_name,P.quantity_in_stock,IT.quantity AS inventory_quantity
FROM Products AS P
JOIN 
    Inventory_Transactions AS IT
	ON P.product_id = IT.product_id;
--In this query we joins the Products table with the Inventory_Transactions table 
--using the product_id foreign key relationship  and show the current inventory quantity for each product.

---------------------------------------------------------------------------------------------------------------------

--Implement basic filtering and sorting options in your SQL queries.

---------------------------------------------------------------------------------------------------------------------
----------------
--FILTERING
----------------
--Different Types of Filtering on products table
SELECT * FROM Products 
WHERE price<500 ;

SELECT product_id,product_name,description,quantity_in_stock from Products
where product_id BETWEEN 103 AND 110;

SELECT product_name,description FROM Products 
WHERE quantity_in_stock >= 20 OR price<1000;

SELECT product_name,price,quantity_in_stock FROM Products 
WHERE product_name LIKE '__a%';

-------------------------------------------------------------------------------------------------------------------------
--Different Types of Filtering on Suppliers table
SELECT * FROM Suppliers
WHERE contact_phone LIKE '1%';

SELECT TOP 5 * FROM Suppliers;

-----------------------------------------------------------------------------------------------------------------------------
--Different Types of Filtering on Inventory_Transactions table
SELECT * FROM Inventory_Transactions 
WHERE product_id = 102 AND quantity > 5;

SELECT * FROM Inventory_Transactions
WHERE transaction_type = 'purchase';

SELECT * FROM Inventory_Transactions
WHERE quantity > 10;

SELECT * FROM Inventory_Transactions
WHERE transaction_type = 'sale';
----------------------------------------------------------------------------------------------------------------------
--------------------
--SORTING--
--------------------
--Different Types of Sorting on Products table
SELECT * FROM Products
ORDER BY price;

SELECT * FROM Products
ORDER BY quantity_in_stock DESC;

SELECT * FROM Products
ORDER BY product_name ASC, price DESC; --------here product_name column is TIE BREAKER

------------------------------------------------------------------------------------------------------------------------
--Different Types of Sorting on Suppliers table
SELECT DISTINCT * FROM Suppliers 
ORDER BY contact_phone;-----here DISTINCT means that  all columns from the Suppliers table returned only unique rows

SELECT * FROM Suppliers 
ORDER BY LEN(contact_name) DESC;--here LENGTH means that the column contact_name sorted in DESCENDING order by specific 
                                --character length from that column

SELECT * FROM Suppliers
ORDER BY LEN(contact_name) ASC;--here LENGTH means that the column contact_name sorted in ASCENDING order by specific 
                               --character length from that column

-------------------------------------------------------------------------------------------------------------------------------
--Different Types of Sorting on Inventory_Transactions table
SELECT * FROM Inventory_Transactions 
ORDER BY product_id ASC,quantity DESC;--in this we first sort product_id in ascending order and
                                      --then by quantity in descending order 

SELECT * FROM Inventory_Transactions 
ORDER BY transaction_type ASC,product_id DESC;--in this we first sort transactions by transaction type in alphabetical order
                                              --and then by product ID in descending order

SELECT * FROM Inventory_Transactions 
ORDER BY CASE 
        WHEN transaction_type = 'sale' THEN 1 
        ELSE 2 
    END,
	quantity ASC;----- in this we use CASE statement for sorting transaction_type as sale
	                --and after that we sort quantity in ascending order

SELECT * 
FROM Inventory_Transactions 
ORDER BY CASE 
        WHEN transaction_type = 'purchase' THEN 1 
        ELSE 2 
    END,
    product_id ASC;----- in this we use CASE statement for sorting transaction_type as purchase
	                --and after that we sort product_id in ascending order





---------------------------------------------------------------------------------------------------------------
--1)In this project, we have created a database called "InventoryManagement_Products_sql" to manage product inventory. 
--2)We have designed and created tables for database "InventoryManagement_Products_sql" products, suppliers,
--and inventory transactions,and inserted sample data into each table.
--3)We have also demonstrated how to perform basic CRUD (Create, Read, Update, Delete) operations 
--on these tables using SQL queries.
--4)We have 'INSERTED' records into the tables, 'UPDATED' existing records, and 'DELETED' records as needed.
--5)we have implemented SQL queries to retrieve(SELECT) and display product information, supplier details, and inventory levels.
--6)We have used JOIN statements to combine data from multiple tables 
--and applied filtering and sorting options to retrieve specific subsets of data.

--Overall, this project provides a foundation for managing inventory data in a relational database using SQL.
--It demonstrates fundamental SQL concepts such as table creation, data insertion, querying, and data manipulation.

