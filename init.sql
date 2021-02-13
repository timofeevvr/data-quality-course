CREATE TABLE Employees (
	EmployeeID integer,
	FirstName varchar(40),
	LastName varchar(40),
	ManagerID integer,
	Salary integer,
	JobPosition varchar(40),
	Active integer
);
CREATE TABLE Managers (
	ManagerID integer,
	FirstName varchar(40),
	LastName varchar(40)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, ManagerID,	Salary,	JobPosition, Active) VALUES
(123, 'John', 'Smith', 147, 2000, 'QA Engineer', 0),
(456, 'Victoria', 'Mush', 147, 3000, 'Senior Engineer', 1),
(789, 'Harry', 'Thomason', 258, 1500, 'QA Engineer', 1);

INSERT INTO Managers (ManagerID, FirstName, LastName) VALUES
(147, 'Maria', 'Ferrero'),
(258, 'Jack', 'Henderson'),
(369, 'Bob', 'Park');