-- Active: 1728982183930@@127.0.0.1@5432@postgres
--  ## Create a DATABASE: ##
CREATE DATABASE db1;


--  ## Rename a DATABASE: ##
ALTER DATABASE db1 RENAME TO db;


--  ## DELETE a DATABASE: ##
DROP DATABASE db;


--  ## Create a student table: ##
CREATE TABLE student (
    student_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    cgpa NUMERIC(1, 2)
)


--  ## Rename a student table: ##
ALTER TABLE student RENAME TO students;


--  ## Delete a table: ##
DROP TABLE students;
TRUNCATE TABLE students;


--  ## Create a table with constraints: ##
CREATE TABLE "users" (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INT DEFAULT 18
);


--  ## 1 ------------ Insert Data into table --------------- ##
INSERT INTO users (user_id, username, email, age) VALUES (2, 'itzJunaed', 'itzJunaed@gmail.com', '20');


--  ## 2 - Insert Data into table ##
INSERT INTO users VALUES
(3, 'Bjorn1', 'BjornLoth@gmail.com'),
(4, 'Ivar1', 'IvarLoth@gmail.com');


--  ## 3 - Insert Data into table ##
INSERT INTO users (username, email) VALUES 
('itzRayhanAhmed', 'itzRayhanAhmed@gmail.com'), 
('itzRagnar', 'itzRagnar@gmail.com');




--  ## 1 ------------ ALTER A TABLE --------------- ##
-- 1. ADD A COLUMN, DROP A COLUMN, CHANGE DATATYPE OF COLUMN:
--  add column:
ALTER TABLE users
ADD COLUMN password VARCHAR(100) DEFAULT 'admin123' NOT NULL;

ALTER TABLE users ADD COLUMN demo int;

-- delete a column:
ALTER TABLE DROP COLUMN age;

-- change a column data type:
ALTER TABLE users ALTER COLUMN demo TYPE text;

-- set a default value to demo column:
ALTER TABLE users ALTER COLUMN demo SET DEFAULT 'Bangladesh';

-- delete a default value from demo column:
ALTER TABLE users ALTER COLUMN demo DROP DEFAULT;

--  rename a column:
ALTER TABLE users RENAME COLUMN demo TO country;

--  add a constraint into existing column:
ALTER TABLE users ALTER COLUMN country SET NOT NULL;
ALTER TABLE users ADD CONSTRAINT unique_table UNIQUE(email);

--  drop a constraint into existing column:
ALTER TABLE users ALTER COLUMN country DROP NOT NULL;
ALTER TABLE users DROP CONSTRAINT unique_table;





--  Departement Table
--  Each departement has many employees:
CREATE TABLE Department (
    deptID SERIAL PRIMARY KEY,
    deptName VARCHAR(50)
);

INSERT INTO Department VALUES (1, 'IT');
DELETE FROM Department WHERE deptID = 1;

--  Employee Table
--  Each Employee has one department:
CREATE TABLE Employee(
    empID SERIAL PRIMARY KEY,
    empName VARCHAR(50) NOT NULL,
    departmentID INT,
    CONSTRAINT fk_constraint_dept 
    FOREIGN KEY (departmentID) 
    REFERENCES Department(deptID)
);

INSERT INTO Employee VALUES (1, 'Junaed', 1);
DELETE FROM Employee WHERE empID = 1;


--####    -----------  Update and Delete Table     ---------------####

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    published_date DATE
);

INSERT INTO courses (course_name, description, published_date) VALUES
('PostgreSQL for developers', 'A Complete Postgres for developers', '2020-07-13'),
('PostgreSQL Administation', 'A PostgreSQL Guide for DBA', NULL),
('PostgreSQL High Performance', NULL, NULL),
('PostgreSQL Bootcamp', 'Learn PostgreSQL via Bootcamp', '2013-08-17'),
('Mastering PostgreSQL', 'Mastering PostgreSQL in 21 Days', '2012-06-12');

SELECT * FROM courses;

--  Update Database table Row:
UPDATE courses SET course_name = 'PostgreSQL for Beginners', description='A Complete PostgreSQL for Begginers' 
WHERE course_id < 2 OR course_id > 4;




CREATE TABLE IF NOT EXISTS departments (
    deptID SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT INTO departments (name) VALUES
('HR'),
('Finance'),
('IT'),
('Marketing'),
('Sales');


CREATE TABLE IF NOT EXISTS employees (
    empID SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    salary INTEGER NOT NULL,
    joining_date DATE NOT NULL,
    deptID INTEGER NOT NULL,
    CONSTRAINT fk_deptID FOREIGN KEY (deptID) REFERENCES departments(deptID) 
);

INSERT INTO employees (name, email, salary, joining_date, deptID) VALUES
('John Doe', 'john.doe@example.com', 50000, '2022-01-15', 1),
('Jane Smith', 'jane.smith@example.com', 60000, '2021-05-21', 2),
('Robert Brown', 'robert.brown@example.com', 45000, '2020-03-12', 3),
('Emily Davis', 'emily.davis@example.com', 55000, '2023-06-11', 4),
('Michael Wilson', 'michael.wilson@example.com', 70000, '2019-09-29', 2),
('Sarah Johnson', 'sarah.johnson@example.com', 62000, '2021-11-01', 1),
('James Lee', 'james.lee@example.com', 47000, '2020-07-19', 3),
('Emma Garcia', 'emma.garcia@example.com', 54000, '2023-02-28', 5),
('David Miller', 'david.miller@example.com', 49000, '2022-08-10', 4),
('Sophia Martinez', 'sophia.martinez@example.com', 58000, '2021-12-15', 5);




--####  ------------    SELECT ALL FIELDS ------------ #####
SELECT * FROM departments;
SELECT * FROM employees;

--####  ------------    SELECT SOME FIELDS ------------ #####
SELECT empID, name, email from employees;

--####  ------------    SELECT Unique values of Column ------------ #####
SELECT DISTINCT name from employees;

--####  ------------    SELECT values of Column with condition ------------ #####
SELECT * FROM employees WHERE salary > 50000 AND salary < 60000;
SELECT * FROM employees WHERE joining_date > '2022-01-01';
SELECT * FROM employees WHERE name <> 'David Miller' AND salary > 50000;




--####  ------------    SELECT values according 'ASC' | 'DESC' and set LIMIT 4 and Page Number 1  ------------ #####
SELECT * FROM employees
ORDER BY name
ASC LIMIT 4 OFFSET 2;

SELECT * FROM employees
ORDER BY name
DESC;


--####  ------------    GET 3rd Highest Salary Holder  ------------ #####
SELECT * FROM employees ORDER BY salary DESC LIMIT 1 OFFSET 2;





--####  ------------    IN, NOT IN, BETWEEN, LIKE  ------------ #####
SELECT * FROM employees WHERE empID IN (3, 4, 5);

SELECT * FROM employees WHERE empID NOT IN (4, 6);

SELECT * FROM employees WHERE salary BETWEEN 50000 AND 60000;

-- #### inclue name with 'a' ####
SELECT * FROM employees WHERE name LIKE '%a%';

-- #### start with 'a' ####
SELECT * FROM employees WHERE name LIKE 'a%';

-- #### end with 'a' ####
SELECT * FROM employees WHERE name LIKE '%a';

-- #### 4th position with 'a' ####
SELECT * FROM employees WHERE name LIKE '___a%';

-- #### 2 char then 'a' then 2 char position with 'a' ####
SELECT * FROM employees WHERE name LIKE '_a_';






--####  ------------    JOIN - INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN    ------------ #####
SELECT * FROM employees 
INNER JOIN department ON department.deptID = employees.deptID;

SELECT * FROM employees
LEFT JOIN department ON department.deptID = employees.deptID;

SELECT * FROM employees
RIGHT JOIN department ON department.deptID = employees.deptID;

SELECT * FROM employees
FULL JOIN department ON department.deptID = employees.deptID;



--####  ------------    AGGREGATE FUNCTIONS    ------------ #####
SELECT SUM (salary) FROM employees;

SELECT AVG(salary) FROM employees;

SELECT MAX(salary) FROM employees;

SELECT MIN(salary) FROM employees;


SELECT deptID, SUM(salary) FROM employees GROUP BY deptID;

SELECT d.name, AVG(e.salary), SUM(e.salary), MAX(e.salary) from employees e
FULL JOIN departments d ON e.deptID = d.deptID
GROUP BY d.name HAVING AVG(e.salary) > 50000;


SELECT d.name, SUM(salary), AVG(salary), MIN(salary), COUNT(*) FROM departments d
FULL JOIN employees e ON e.deptID = d.deptID
GROUP BY d.deptID;





--####  ------------   SUB QUERIES   ------------ #####
SELECT dept_id, avg_salary FROM (
    SELECT deptID as dept_ID, AVG (salary) as avg_salary FROM employees GROUP BY deptID
) as tempTable;


SELECT email, (
    SELECT avg(salary) FROM employees
) FROM employees;

SELECT * FROM employees WHERE salary IN (
    SELECT salary from employees WHERE name LIKE '%a%'
);

SELECT name, salary FROM employees WHERE name LIKE '%a%';

SELECT * FROM employees WHERE salary > (
    SELECT AVG(salary) from employees
);





--####  ------------   VIEW   ------------ #####
CREATE VIEW department_emp_count
AS SELECT name, count(empID) from employees e
JOIN department d ON d.deptID = e.deptID
GROUP BY d.deptID;




--####  ------------   INDEXING   ------------ #####

CREATE INDEX name_of_index ON employees (name);

EXPLAIN ANALYZE SELECT empID, name, email FROM employees WHERE name = "David Miller";

SELECT * FROM employees;