-- create the database
CREATE DATABASE EmployeeDB;
GO
-- use the database
USE EmployeeDB;
GO
-- create the department table
CREATE TABLE Department (
    DepartId INT PRIMARY KEY,
    DepartName VARCHAR(50) NOT NULL,
    Description VARCHAR(100) NOT NULL
);
GO
-- create the employee table
CREATE TABLE Employee (
    EmpCode CHAR(6) PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Birthday SMALLDATETIME NOT NULL,
    Gender BIT DEFAULT 1,
    Address VARCHAR(100),
    DepartID INT,
    Salary MONEY,
    CONSTRAINT fk_Department FOREIGN KEY (DepartID) REFERENCES Department(DepartId)
);
GO
-- cau 1
-- insert into department table
INSERT INTO Department (DepartId, DepartName, Description)
VALUES 
    (101, 'Sales', 'Ban san pham va dich vu'),
    (102, 'Marketing', 'Quang ba cac san pham'),
    (103, 'Engineering', 'Thiet ke va xay dung san pham');
GO

-- insert into employee table
INSERT INTO Employee (EmpCode, FirstName, LastName, Birthday, Gender, Address, DepartID, Salary)
VALUES
    ('E10101', 'Van', 'Hau', '2000-01-01', 1, 'Ha Noi', 101, 50000),
    ('E10102', 'Van', 'Thanh', '1999-05-12', 0, 'Hai Duong', 101, 55000),
    ('E10201', 'Ngoc', 'Hai', '1985-07-23', 1, 'Ninh Binh', 102, 60000),
    ('E10202', 'Van', 'Toan', '1990-10-15', 0, 'Thai Binh', 102, 65000),
    ('E10301', 'Quang', 'Hai', '1979-03-07', 1, 'Ha Noi', 103, 70000),
    ('E10302', 'Ngoc', 'Hue', '2003-11-28', 0, 'TP HCM', 103, 75000);
GO
--cau 2
UPDATE Employee
SET Salary = Salary * 1.1;

--cau3
ALTER TABLE Employee
ADD CONSTRAINT CK_Salary CHECK (Salary > 0);

-- cau 5
CREATE UNIQUE NONCLUSTERED INDEX IX_DepartmentName
ON Department (DepartName);
