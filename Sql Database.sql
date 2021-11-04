-- The SQL CREATE DATABASE Statement

-- The CREATE DATABASE statement is used to create a new SQL database.

-- Syntax

CREATE DATABASE databasename;

-- CREATE DATABASE Example

CREATE DATABASE testDB;



-- SQL DROP DATABASE Statement

-- The DROP DATABASE statement is used to drop an existing SQL database.

DROP DATABASE databasename;

-- DROP DATABASE Example

-- The following SQL statement drops the existing database "testDB":

DROP DATABASE testDB;



-- SQL BACKUP DATABASE Statement

-- The BACKUP DATABASE statement is used in SQL Server to create a full back up of an existing SQL database.

BACKUP DATABASE databasename
TO DISK = 'filepath';

-- SQL BACKUP WITH DIFFERENTIAL Statement

-- A differential back up only backs up the parts of the database that have changed since the last full database backup.

BACKUP DATABASE databasename
TO DISK = 'filepath'
WITH DIFFERENTIAL;

-- BACKUP DATABASE Example

-- The following SQL statement creates a full back up of the existing database "testDB" to the D disk:

BACKUP DATABASE testDB
TO DISK = 'D:\backups\testDB.bak';

-- BACKUP WITH DIFFERENTIAL Example

-- The following SQL statement creates a differential back up of the database "testDB":

BACKUP DATABASE testDB
TO DISK = 'D:\backups\testDB.bak'
WITH DIFFERENTIAL;

-- Tip: A differential back up reduces the back up time (since only the changes are backed up).



-- SQL CREATE TABLE Statement

-- The CREATE TABLE statement is used to create a new table in a database.

CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);

-- SQL CREATE TABLE Example

-- The following example creates a table called "Persons" that contains five columns: PersonID, LastName, FirstName, Address, and City:

CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

-- Create Table Using Another Table

-- A copy of an existing table can also be created using CREATE TABLE.

-- The new table gets the same column definitions. All columns or specific columns can be selected.

-- If you create a new table using an existing table, the new table will be filled with the existing values from the old table.

CREATE TABLE new_table_name AS
    SELECT column1, column2,...
    FROM existing_table_name
    WHERE ....;

-- The following SQL creates a new table called "TestTables" (which is a copy of the "Customers" table):

CREATE TABLE TestTable AS
SELECT customername, contactname
FROM customers;



-- SQL DROP TABLE Statement

-- The DROP TABLE statement is used to drop an existing table in a database.

DROP TABLE table_name;

--SQL DROP TABLE Example

-- The following SQL statement drops the existing table "Shippers":

DROP TABLE Shippers;

-- SQL TRUNCATE TABLE

-- The TRUNCATE TABLE statement is used to delete the data inside a table, but not the table itself.

TRUNCATE TABLE table_name;



-- SQL ALTER TABLE Statement

-- The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.

-- The ALTER TABLE statement is also used to add and drop various constraints on an existing table.

-- ALTER TABLE - ADD Column

-- To add a column in a table, use the following syntax:

ALTER TABLE table_name
ADD column_name datatype;

-- The following SQL adds an "Email" column to the "Customers" table:

ALTER TABLE Customers
ADD Email varchar(255);

-- ALTER TABLE - DROP COLUMN

-- To delete a column in a table, use the following syntax (notice that some database systems don't allow deleting a column):

ALTER TABLE table_name
DROP COLUMN column_name;

-- The following SQL deletes the "Email" column from the "Customers" table:

ALTER TABLE Customers
DROP COLUMN Email;

-- ALTER TABLE - ALTER/MODIFY COLUMN
-- To change the data type of a column in a table, use the following syntax:

ALTER TABLE table_name
ALTER COLUMN column_name datatype;

-- SQL ALTER TABLE Example

-- Now we want to add a column named "DateOfBirth" in the "Persons" table.

ALTER TABLE Persons
ADD DateOfBirth date;

-- Change Data Type Example

-- Now we want to change the data type of the column named "DateOfBirth" in the "Persons" table.

ALTER TABLE Persons
ALTER COLUMN DateOfBirth year;

-- DROP COLUMN Example
-- To delete the column named "DateOfBirth" in the "Persons" table.

ALTER TABLE Persons
DROP COLUMN DateOfBirth;



-- SQL Constraints

-- SQL Create Constraints

CREATE TABLE table_name (
    column1 datatype constraint,
    column2 datatype constraint,
    column3 datatype constraint,
    ....
);

-- SQL NOT NULL Constraint

-- SQL NOT NULL on CREATE TABLE

-- The following SQL ensures that the "ID", "LastName", and "FirstName" columns will NOT accept NULL values when the "Persons" table is created:

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);

-- SQL NOT NULL on ALTER TABLE

-- To create a NOT NULL constraint on the "Age" column when the "Persons" table is already created, use the following SQL:

ALTER TABLE Persons
MODIFY Age int NOT NULL;



-- SQL UNIQUE Constraint

-- SQL UNIQUE Constraint on CREATE TABLE

-- The following SQL creates a UNIQUE constraint on the "ID" column when the "Persons" table is created:

CREATE TABLE Persons (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

-- To name a UNIQUE constraint, and to define a UNIQUE constraint on multiple columns, use the following SQL syntax:

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID,LastName)
);

-- SQL UNIQUE Constraint on ALTER TABLE

-- To create a UNIQUE constraint on the "ID" column when the table is already created, use the following SQL:

ALTER TABLE Persons
ADD UNIQUE (ID);

-- To name a UNIQUE constraint, and to define a UNIQUE constraint on multiple columns, use the following SQL syntax:

ALTER TABLE Persons
ADD CONSTRAINT UC_Person UNIQUE (ID,LastName);

-- DROP a UNIQUE Constraint

-- To drop a UNIQUE constraint, use the following SQL:

ALTER TABLE Persons
DROP CONSTRAINT UC_Person;



-- SQL PRIMARY KEY Constrain

-- SQL PRIMARY KEY on CREATE TABLE

-- The following SQL creates a PRIMARY KEY on the "ID" column when the "Persons" table is created:

CREATE TABLE Persons (
    ID int NOT NULL PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

-- To allow naming of a PRIMARY KEY constraint, and for defining a PRIMARY KEY constraint on multiple columns, use the following SQL syntax:

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
);

-- Note: In the example above there is only ONE PRIMARY KEY (PK_Person). However, the VALUE of the primary key is made up of TWO COLUMNS (ID + LastName).

-- SQL PRIMARY KEY on ALTER TABLE

-- To create a PRIMARY KEY constraint on the "ID" column when the table is already created, use the following SQL:

ALTER TABLE Persons
ADD PRIMARY KEY (ID);

-- To allow naming of a PRIMARY KEY constraint, and for defining a PRIMARY KEY constraint on multiple columns, use the following SQL syntax:

ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);

-- Note: If you use ALTER TABLE to add a primary key, the primary key column(s) must have been declared to not contain NULL values (when the table was first created).

-- DROP a PRIMARY KEY Constraint

-- To drop a PRIMARY KEY constraint, use the following SQL:

ALTER TABLE Persons
DROP CONSTRAINT PK_Person;



-- SQL FOREIGN KEY Constraint

-- The following SQL creates a FOREIGN KEY on the "PersonID" column when the "Orders" table is created:

CREATE TABLE Orders (
    OrderID int NOT NULL PRIMARY KEY,
    OrderNumber int NOT NULL,
    PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
);

-- To allow naming of a FOREIGN KEY constraint, and for defining a FOREIGN KEY constraint on multiple columns, use the following SQL syntax:

CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
    REFERENCES Persons(PersonID)
);

-- SQL FOREIGN KEY on ALTER TABLE

-- To create a FOREIGN KEY constraint on the "PersonID" column when the "Orders" table is already created, use the following SQL:

ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

-- To allow naming of a FOREIGN KEY constraint, and for defining a FOREIGN KEY constraint on multiple columns, use the following SQL syntax:

ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

-- DROP a FOREIGN KEY Constraint

-- To drop a FOREIGN KEY constraint, use the following SQL:

ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;



-- SQL CHECK Constraint

-- SQL CHECK on CREATE TABLE

-- The following SQL creates a CHECK constraint on the "Age" column when the "Persons" table is created. The CHECK constraint ensures that the age of a person must be 18, or older:

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int CHECK (Age>=18)
);

-- To allow naming of a CHECK constraint, and for defining a CHECK constraint on multiple columns, use the following SQL syntax:

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);

-- SQL CHECK on ALTER TABLE

-- To create a CHECK constraint on the "Age" column when the table is already created, use the following SQL:

ALTER TABLE Persons
ADD CHECK (Age>=18);

-- To allow naming of a CHECK constraint, and for defining a CHECK constraint on multiple columns, use the following SQL syntax:

ALTER TABLE Persons
ADD CONSTRAINT CHK_PersonAge CHECK (Age>=18 AND City='Sandnes');

-- DROP a CHECK Constraint
-- To drop a CHECK constraint, use the following SQL:

ALTER TABLE Persons
DROP CONSTRAINT CHK_PersonAge;



-- SQL DEFAULT Constraint

-- SQL DEFAULT on CREATE TABLE

-- The following SQL sets a DEFAULT value for the "City" column when the "Persons" table is created:

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);

-- The DEFAULT constraint can also be used to insert system values, by using functions like GETDATE():

CREATE TABLE Orders (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT GETDATE()
);

-- SQL DEFAULT on ALTER TABLE

-- To create a DEFAULT constraint on the "City" column when the table is already created, use the following SQL:

ALTER TABLE Persons
ADD CONSTRAINT df_City
DEFAULT 'Sandnes' FOR City;

-- DROP a DEFAULT Constraint

-- To drop a DEFAULT constraint, use the following SQL:

ALTER TABLE Persons
ALTER COLUMN City DROP DEFAULT;



-- SQL CREATE INDEX Statement

-- CREATE INDEX Syntax

-- Creates an index on a table. Duplicate values are allowed:

CREATE INDEX index_name
ON table_name (column1, column2, ...);

-- CREATE UNIQUE INDEX Syntax

-- Creates a unique index on a table. Duplicate values are not allowed:

CREATE UNIQUE INDEX index_name
ON table_name (column1, column2, ...);

-- Note: The syntax for creating indexes varies among different databases. Therefore: Check the syntax for creating indexes in your database.

-- CREATE INDEX Example

--The SQL statement below creates an index named "idx_lastname" on the "LastName" column in the "Persons" table:

CREATE INDEX idx_lastname
ON Persons (LastName);

-- If you want to create an index on a combination of columns, you can list the column names within the parentheses, separated by commas:

CREATE INDEX idx_pname
ON Persons (LastName, FirstName);

-- DROP INDEX Statement

-- The DROP INDEX statement is used to delete an index in a table.

DROP INDEX table_name.index_name;



-- SQL AUTO INCREMENT Field

-- Syntax for SQL Server

-- The following SQL statement defines the "Personid" column to be an auto-increment primary key field in the "Persons" table:

CREATE TABLE Persons (
    Personid int IDENTITY(1,1) PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);



-- SQL Working With Dates

-- SQL Date Data Types

-- SQL Server comes with the following data types for storing a date or a date/time value in the database:

-- DATE - format YYYY-MM-DD

-- DATETIME - format: YYYY-MM-DD HH:MI:SS

-- SMALLDATETIME - format: YYYY-MM-DD HH:MI:SS

-- TIMESTAMP - format: a unique number

-- Note: The date types are chosen for a column when you create a new table in your database!

SELECT * FROM Orders WHERE OrderDate='2008-11-11'

-- Tip: To keep your queries simple and easy to maintain, do not use time-components in your dates, unless you have to!



-- SQL CREATE VIEW Statement

-- CREATE VIEW Syntax

CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

-- Note: A view always shows up-to-date data! The database engine recreates the view, every time a user queries it.

-- SQL CREATE VIEW Examples

-- The following SQL creates a view that shows all customers from Brazil:

CREATE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = 'Brazil';

-- We can query the view above as follows:

SELECT * FROM [Brazil Customers];

-- The following SQL creates a view that selects every product in the "Products" table with a price higher than the average price:

CREATE VIEW [Products Above Average Price] AS
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

-- We can query the view above as follows:

SELECT * FROM [Products Above Average Price];

-- SQL Updating a View

-- A view can be updated with the CREATE OR REPLACE VIEW statement.

SQL CREATE OR REPLACE VIEW Syntax
CREATE OR REPLACE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

--The following SQL adds the "City" column to the "Brazil Customers" view:

CREATE OR REPLACE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName, City
FROM Customers
WHERE Country = 'Brazil';

-- SQL Dropping a View

-- A view is deleted with the DROP VIEW statement.

-- SQL DROP VIEW Syntax

DROP VIEW view_name;

-- The following SQL drops the "Brazil Customers" view:

DROP VIEW [Brazil Customers];

--- All SQL Codes can be found here at https://www.w3schools.com/sql/default.asp

