-- What is SQL?
--		SQL stands for Structured Query Language
--		SQL lets you access and manipulate databases
--		SQL became a standard of the American National Standards Institute (ANSI) in 1986, and of the International Organization for Standardization (ISO) in 1987

-- What Can SQL do?
--		SQL can execute queries against a database
--		SQL can retrieve data from a database
--		SQL can insert records in a database
--		SQL can update records in a database
--		SQL can delete records from a database
--		SQL can create new databases
--		SQL can create new tables in a database
--		SQL can create stored procedures in a database
--		SQL can create views in a database
--		SQL can set permissions on tables, procedures, and views

--	Some of The Most Important SQL Commands
--		SELECT - extracts data from a database
--		UPDATE - updates data in a database
--		DELETE - deletes data from a database
--		INSERT INTO - inserts new data into a database
--		CREATE DATABASE - creates a new database
--		ALTER DATABASE - modifies a database
--		CREATE TABLE - creates a new table
--		ALTER TABLE - modifies a table
--		DROP TABLE - deletes a table
--		CREATE INDEX - creates an index (search key)
--		DROP INDEX - deletes an index


-- The SQL SELECT Statement

SELECT Syntax
SELECT column1, column2, ...
FROM table_name;

--	SELECT Column Example

SELECT CustomerName, City FROM Customers;

SELECT * FROM Customers;



-- The SQL SELECT DISTINCT Statement

SELECT DISTINCT column1, column2, ...
FROM table_name;

-- SELECT DISTINCT Examples

SELECT DISTINCT Country FROM Customers;

SELECT COUNT(DISTINCT Country) FROM Customers;



-- SQL WHERE Clause

SELECT column1, column2, ...
FROM table_name
WHERE condition;

-- WHERE Clause Example

SELECT * FROM Customers
WHERE Country='Mexico';

SELECT * FROM Customers
WHERE CustomerID=1;



-- The SQL AND, OR and NOT Operators

-- AND Syntax
SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;

-- AND Example
SELECT * FROM Customers
WHERE Country='Germany' AND City='Berlin';

-- OR Syntax
SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;

--	OR Example
SELECT * FROM Customers
WHERE City='Berlin' OR City='München';

SELECT * FROM Customers
WHERE Country='Germany' OR Country='Spain';

-- NOT Syntax
SELECT column1, column2, ...
FROM table_name
WHERE NOT condition;

SELECT * FROM Customers
WHERE NOT Country='Germany';

-- Combining AND, OR and NOT

SELECT * FROM Customers
WHERE Country='Germany' AND (City='Berlin' OR City='München');

SELECT * FROM Customers
WHERE NOT Country='Germany' AND NOT Country='USA';



-- The SQL ORDER BY Keyword

-- ORDER BY Syntax

SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;

-- ORDER BY Example

SELECT * FROM Customers
ORDER BY Country;

SELECT * FROM Customers
ORDER BY Country DESC;

SELECT * FROM Customers
ORDER BY Country, CustomerName;

SELECT * FROM Customers
ORDER BY Country ASC, CustomerName DESC;



-- SQL INSERT INTO Statement

-- INSERT INTO Syntax

INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

INSERT INTO table_name
VALUES (value1, value2, value3, ...);

-- INSERT INTO Example

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');



-- SQL NULL Values

-- IS NULL Syntax

SELECT column_names
FROM table_name
WHERE column_name IS NULL;

-- IS NOT NULL Syntax

SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL;

-- The IS NULL Operator

SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NULL;

-- The IS NOT NULL Operator

SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NOT NULL;


-- SQL UPDATE Statement

-- UPDATE Syntax

UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

-- UPDATE Table

UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 1;

-- UPDATE Multiple Records

UPDATE Customers
SET ContactName='Juan'
WHERE Country='Mexico';

-- Update Warning!

UPDATE Customers
SET ContactName='Juan';



-- SQL DELETE Statement

DELETE FROM table_name WHERE condition;

-- SQL DELETE Example

DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';

-- Delete All Records

DELETE FROM table_name;

-- The following SQL statement deletes all rows in the "Customers" table, without deleting the table:

DELETE FROM Customers;



-- The SQL SELECT TOP Clause

SELECT TOP number|percent column_name(s)
FROM table_name
WHERE condition;

-- SQL TOP, LIMIT and FETCH FIRST Examples

SELECT TOP 3 * FROM Customers;

-- SQL TOP PERCENT Example

SELECT TOP 50 PERCENT * FROM Customers;

-- ADD a WHERE CLAUSE

SELECT TOP 3 * FROM Customers
WHERE Country='Germany';



-- SQL MIN() and MAX() Functions

-- MIN() Syntax

SELECT MIN(column_name)
FROM table_name
WHERE condition;

-- MIN() Example

SELECT MIN(Price) AS SmallestPrice
FROM Products;

-- MAX() Syntax

SELECT MAX(column_name)
FROM table_name
WHERE condition;

-- MAX() Example

SELECT MAX(Price) AS LargestPrice
FROM Products;



-- SQL COUNT(), AVG() and SUM() Functions

-- COUNT() Syntax

SELECT COUNT(column_name)
FROM table_name
WHERE condition;

-- COUNT() Example

SELECT COUNT(ProductID)
FROM Products;

-- AVG() Syntax

SELECT AVG(column_name)
FROM table_name
WHERE condition;

-- AVG() Example

SELECT AVG(Price)
FROM Products;

-- SUM() Syntax

SELECT SUM(column_name)
FROM table_name
WHERE condition;

-- SUM() Example

SELECT SUM(Quantity)
FROM OrderDetails;



-- SQL LIKE Operator

-- LIKE Syntax

SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;

-- SQL LIKE Examples

SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';

SELECT * FROM Customers
WHERE CustomerName LIKE '%a';

SELECT * FROM Customers
WHERE CustomerName LIKE '%or%';

SELECT * FROM Customers
WHERE CustomerName LIKE '_r%';

SELECT * FROM Customers
WHERE CustomerName LIKE 'a__%';

SELECT * FROM Customers
WHERE ContactName LIKE 'a%o';

SELECT * FROM Customers
WHERE CustomerName NOT LIKE 'a%';



-- SQL Wildcards

-- Using the % Wildcard

SELECT * FROM Customers
WHERE City LIKE 'ber%';

SELECT * FROM Customers
WHERE City LIKE '%es%';

-- Using the _ Wildcard

SELECT * FROM Customers
WHERE City LIKE '_ondon';

SELECT * FROM Customers
WHERE City LIKE 'L_n_on';

-- Using the [charlist] Wildcard

SELECT * FROM Customers
WHERE City LIKE '[bsp]%';

SELECT * FROM Customers
WHERE City LIKE '[a-c]%';

-- Using the [!charlist] Wildcard

SELECT * FROM Customers
WHERE City LIKE '[!bsp]%';

SELECT * FROM Customers
WHERE City NOT LIKE '[bsp]%';



-- SQL IN Operator

-- IN Syntax

SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);

SELECT column_name(s)
FROM table_name
WHERE column_name IN (SELECT STATEMENT);

-- IN Operator Examples

SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');

SELECT * FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK');

SELECT * FROM Customers
WHERE Country IN (SELECT Country FROM Suppliers);



-- SQL BETWEEN Operator

-- BETWEEN Syntax

SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;

-- BETWEEN Example

SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;

-- NOT BETWEEN Example

SELECT * FROM Products
WHERE Price NOT BETWEEN 10 AND 20;

-- BETWEEN with IN Example

SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20
AND CategoryID NOT IN (1,2,3);

-- BETWEEN Text Values Example

SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

SELECT * FROM Products
WHERE ProductName BETWEEN "Carnarvon Tigers" AND "Chef Anton's Cajun Seasoning"
ORDER BY ProductName;

-- NOT BETWEEN Text Values Example

SELECT * FROM Products
WHERE ProductName NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

-- BETWEEN Dates Example

SELECT * FROM Orders
WHERE OrderDate BETWEEN #07/01/1996# AND #07/31/1996#;

SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';



--- SQL Aliases

-- Alias Column Syntax

SELECT column_name AS alias_name
FROM table_name;

-- Alias for Columns Examples

SELECT CustomerID AS ID, CustomerName AS Customer
FROM Customers;

SELECT CustomerName AS Customer, ContactName AS [Contact Person]
FROM Customers;

SELECT CustomerName, Address + ', ' + PostalCode + ' ' + City + ', ' + Country AS Address
FROM Customers;

-- Alias Table Syntax

SELECT column_name(s)
FROM table_name AS alias_name;

-- Alias for Tables Example

SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;



-- SQL INNER JOIN Keyword

-- INNER JOIN Syntax

SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;

-- SQL INNER JOIN Example

SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--  JOIN Three Tables

SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);



-- SQL LEFT JOIN Keyword

-- LEFT JOIN Syntax

SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;

-- SQL LEFT JOIN Example

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;



-- SQL RIGHT JOIN Keyword

-- RIGHT JOIN Syntax

SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;

-- SQL RIGHT JOIN Example

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;



-- SQL FULL OUTER JOIN Keyword

-- FULL OUTER JOIN Syntax

SELECT column_name(s)
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition;

-- SQL FULL OUTER JOIN Example

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;



-- SQL Self Join

-- Self Join Syntax

SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;

-- SQL Self Join Example

SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;



-- SQL UNION Operator

-- UNION Syntax

SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;

-- SQL UNION Example

SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;

-- UNION ALL Syntax

SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;

-- SQL UNION ALL Example

SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers
ORDER BY City;

-- SQL UNION With WHERE

SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;

-- SQL UNION ALL With WHERE

SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION ALL
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;

-- Another UNION Example

SELECT 'Customer' AS Type, ContactName, City, Country
FROM Customers
UNION
SELECT 'Supplier', ContactName, City, Country
FROM Suppliers;



-- SQL GROUP BY Statement

-- GROUP BY Syntax

SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);

-- SQL GROUP BY Examples

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;

-- GROUP BY With JOIN Example

SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;



-- SQL HAVING Clause

-- HAVING Syntax

SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);

-- SQL HAVING Examples

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;

-- More HAVING Examples

SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM (Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID)
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 10;

SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'Davolio' OR LastName = 'Fuller'
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 25;



-- SQL EXISTS Operator

-- EXISTS Syntax

SELECT column_name(s)
FROM table_name
WHERE EXISTS
(SELECT column_name FROM table_name WHERE condition);

-- SQL EXISTS Examples

SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName 
				FROM Products 
				WHERE Products.SupplierID = Suppliers.supplierID 
					AND Price < 20);

SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName 
				FROM Products 
				WHERE Products.SupplierID = Suppliers.supplierID 
					AND Price = 22);



-- SQL ANY and ALL Operators

-- ANY Syntax

SELECT column_name(s)
FROM table_name
WHERE column_name operator ANY
  (SELECT column_name
  FROM table_name
  WHERE condition);


-- The SQL ALL Operator

-- ALL Syntax With SELECT

SELECT ALL column_name(s)
FROM table_name
WHERE condition;

-- SQL ANY Examples

-- The following SQL statement lists the ProductName if it finds ANY records 
-- in the OrderDetails table has Quantity equal to 10 
-- (this will return TRUE because the Quantity column has some values of 10):

SELECT ProductName
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID
  FROM OrderDetails
  WHERE Quantity = 10);

-- The following SQL statement lists the ProductName if it finds ANY records 
-- in the OrderDetails table has Quantity larger than 99 
-- (this will return TRUE because the Quantity column has some values larger than 99):

SELECT ProductName
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID
  FROM OrderDetails
  WHERE Quantity > 99);

-- The following SQL statement lists the ProductName if it finds ANY records 
-- in the OrderDetails table has Quantity larger than 1000 
-- (this will return FALSE because the Quantity column has no values larger than 1000):

SELECT ProductName
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID
  FROM OrderDetails
  WHERE Quantity > 1000);


-- ALL Syntax With WHERE or HAVING

SELECT column_name(s)
FROM table_name
WHERE column_name operator ALL
  (SELECT column_name
  FROM table_name
  WHERE condition);

-- SQL ALL Examples

SELECT ALL ProductName
FROM Products
WHERE TRUE;

-- The following SQL statement lists the ProductName if ALL the records 
-- in the OrderDetails table has Quantity equal to 10. This will of course 
-- return FALSE because the Quantity column has many different values (not only the value of 10):

SELECT ProductName
FROM Products
WHERE ProductID = ALL 
  (SELECT ProductID
  FROM OrderDetails
  WHERE Quantity = 10);
  


 -- SQL SELECT INTO Statement

 -- SELECT INTO Syntax

 SELECT *
INTO newtable [IN externaldb]
FROM oldtable
WHERE condition;

-- Copy only some columns into a new table:

SELECT column1, column2, column3, ...
INTO newtable [IN externaldb]
FROM oldtable
WHERE condition;

-- SQL SELECT INTO Examples

SELECT * INTO CustomersBackup2017
FROM Customers;

-- The following SQL statement uses the IN clause to copy the table into a new table in another database:

SELECT * INTO CustomersBackup2017 IN 'Backup.mdb'
FROM Customers;

-- The following SQL statement copies only a few columns into a new table:

SELECT CustomerName, ContactName INTO CustomersBackup2017
FROM Customers;

-- The following SQL statement copies only the German customers into a new table:

SELECT * INTO CustomersGermany
FROM Customers
WHERE Country = 'Germany';

-- The following SQL statement copies data from more than one table into a new table:

SELECT Customers.CustomerName, Orders.OrderID
INTO CustomersOrderBackup2017
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Tip: SELECT INTO can also be used to create a new, empty table using the schema of another. 
-- Just add a WHERE clause that causes the query to return no data:

SELECT * INTO newtable
FROM oldtable
WHERE 1 = 0;



-- SQL INSERT INTO SELECT Statement

-- INSERT INTO SELECT Syntax

-- Copy all columns from one table to another table:

INSERT INTO table2
SELECT * FROM table1

-- Copy only some columns from one table into another table:

INSERT INTO table2 (column1, column2, column3, ...)
SELECT column1, column2, column3, ...
FROM table1
WHERE condition;

-- SQL INSERT INTO SELECT Examples
-- The following SQL statement copies "Suppliers" into "Customers" (the columns that are not filled with data, will contain NULL):

INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers;

--The following SQL statement copies "Suppliers" into "Customers" (fill all columns):

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
SELECT SupplierName, ContactName, Address, City, PostalCode, Country FROM Suppliers;

-- The following SQL statement copies only the German suppliers into "Customers":

INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers
WHERE Country='Germany';



-- SQL CASE Statement

-- CASE Syntax

CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;

-- SQL CASE Examples

SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;

SELECT CustomerName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END);



-- SQL NULL Functions

-- The SQL Server ISNULL() function lets you return an alternative value when an expression is NULL:

SELECT ProductName, UnitPrice * (UnitsInStock + ISNULL(UnitsOnOrder, 0))
FROM Products;



-- SQL Stored Procedures for SQL Server

-- Stored Procedure Syntax

CREATE PROCEDURE procedure_name
AS
sql_statement
GO;

-- Execute a Stored Procedure

EXEC procedure_name;


-- Stored Procedure Example


CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;

-- Execute a Stored Procedure

EXEC SelectAllCustomers;

-- Stored Procedure With One Parameter

-- The following SQL statement creates a stored procedure that selects Customers from a particular City from the "Customers" table:


CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO;

-- Execute the stored procedure above as follows:

EXEC SelectAllCustomers @City = 'London';

-- Stored Procedure With Multiple Parameters


CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode
GO;

-- Execute the stored procedure above as follows:

EXEC SelectAllCustomers @City = 'London', @PostalCode = 'WA1 1DP';


--- All SQL Codes can be found here at https://www.w3schools.com/sql/default.asp