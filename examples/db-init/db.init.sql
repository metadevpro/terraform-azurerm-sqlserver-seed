-- Your Transact SQL Script here to initalize the DB

CREATE USER user87 WITH PASSWORD = 'P4ssw0rd!Acme';
GO

CREATE TABLE Employee (
    Id        int NOT NULL PRIMARY KEY,  
    FirstName nvarchar(25) NOT NULL, 
    LastName  nvarchar(25) NOT NULL
);
GO

INSERT INTO Employee (Id, FirstName, LastName) VALUES (1, N'Alicia', N'Keys');
INSERT INTO Employee (Id, FirstName, LastName) VALUES (2, N'Jesica', N'Alba');
INSERT INTO Employee (Id, FirstName, LastName) VALUES (3, N'Ana', N'Zamora');
GO

-- Verify data is in
SELECT * FROM Employee;

GRANT TAKE OWNERSHIP TO user87;  
GO
