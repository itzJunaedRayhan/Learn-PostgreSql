CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO
    employees (
        emp_id,
        emp_name,
        department,
        salary
    )
VALUES (1, 'John Doe', 'HR', 50000.00),
    (
        2,
        'Jane Smith',
        'IT',
        60000.00
    ),
    (
        3,
        'Michael Johnson',
        'Finance',
        55000.00
    ),
    (
        4,
        'Emily Brown',
        'HR',
        52000.00
    );

SELECT emp_name, salary from employees WHERE department = 'HR';

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10, 2)
);

INSERT INTO orders ( order_id, customer_id, total_amount)
VALUES (101, 1, 200.00), (102, 2, 300.00), (103, 1, 150.00), (104, 3, 400.00), (105, 2, 250.00);


SELECT customer_id, AVG(total_amount) average_total_amount from orders
GROUP BY customer_id HAVING AVG(total_amount) >= 250;



-- Task 3: JOIN and GROUP BY Create two tables named "students" and "courses" with columns as follows:
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    credits INT
);

INSERT INTO students (student_id, student_name, age, gender)
VALUES
    (1, 'Alice', 22, 'Female'),
    (2, 'Bob', 21, 'Male'),
    (3, 'Charlie', 23, 'Male');

INSERT INTO courses (course_id, course_name, credits)
VALUES
    (101, 'Mathematics', 3),
    (102, 'History', 4),
    (103, 'Physics', 3);

-- Enrollment table with student-course relationships
CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT
);

INSERT INTO enrollment (enrollment_id, student_id, course_id)
VALUES
    (1, 1, 101),
    (2, 1, 102),
    (3, 2, 103),
    (4, 3, 101);

SELECT * FROM enrollment;

SELECT s.student_name, cr.course_name, cr.credits
FROM students s
JOIN enrollment e ON e.student_id = s.student_id
JOIN courses cr ON cr.course_id = e.course_id;




-- Task 4: Multiple Joins and Aggregation Create three tables named "employees," "departments," and "salaries" with columns as follows:
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE salaries (
    emp_id INT,
    salary DECIMAL(10, 2)
);

INSERT INTO employees (emp_id, emp_name, department_id)
VALUES
    (1, 'John Doe', 1),
    (2, 'Jane Smith', 2),
    (3, 'Michael Johnson', 1),
    (4, 'Emily Brown', 3);

INSERT INTO departments (department_id, department_name)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');

INSERT INTO salaries (emp_id, salary)
VALUES
    (1, 50000.00),
    (2, 60000.00),
    (3, 55000.00),
    (4, 52000.00);



SELECT d.department_name, AVG(s.salary) AS avg_salary
FROM employees e
JOIN salaries s ON s.emp_id = e.emp_id
JOIN departments d ON e.emp_id = d.department_id
GROUP BY d.department_name;





