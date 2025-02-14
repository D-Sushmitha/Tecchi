EMPLOYEE MANAGEMENT SYSTEM(casestudy 2):-

create database EmployeeManagement;
use EmployeeManagement;

#Department Table
create table dept(
dept_id int primary key auto_increment,
dept_name varchar(50)
);
desc dept;

#Inserting values to Department table
INSERT INTO dept ( dept_id,dept_name) VALUES 
(100,'Accounts'), 
(200,'Sales'), 
(300,'It'), 
(400,'Human Resources'), 
(500,'Engineering');

Select * from dept; //# to view the dept values in table

#Employee Table
create table emp1(
 emp1_id INT PRIMARY KEY AUTO_INCREMENT,
    emp1_name VARCHAR(50) NOT NULL,
    emp1_gender VARCHAR(10) NOT NULL,
    emp1_age INT NOT NULL,
    emp1_sal INT NOT NULL CHECK(emp1_sal > 30000)
);

ALTER TABLE emp1
ADD COLUMN dept_id INT;

desc emp1;

#Inserting Values to Employee table
insert into emp1 (emp1_name, emp1_gender, dept_id, emp1_age, emp1_sal) values
('jayanthi','female', 100,20,70000),
('priya','female',200,23,40000),
('jeeva','male',300,24,35000),
('arun','male',400,25,50000),
('keertana','female',500,21,38000),
('siddhu','male',1,22,55000);

select * from emp1;

#Project table
CREATE TABLE Projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    budget INT NOT NULL CHECK (budget > 10000)
);

#Inserting values into Project table
INSERT INTO Projects (id, name, budget) VALUES
(1, 'Project Online Shopping', 50000),
(2, 'Project App Development', 100000),
(3, 'Project Cosmetics App', 75000),
(4, 'Project Home interiors', 120000);


#Employee project Table
CREATE TABLE Employee_Projects (
    employee_id INT,
    project_id INT,
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES emp(emp_id),
    FOREIGN KEY (project_id) REFERENCES Projects(id)
);
desc Employee_Projects;

#Inserting values to Employee_Projects table
INSERT INTO Employee_Projects (employee_id, project_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

select * from Employee_Projects;

#Attendance table

CREATE TABLE Attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    date DATE NOT NULL,
    status ENUM('Present', 'Absent', 'On Leave'),
    FOREIGN KEY (employee_id) REFERENCES emp(emp_id)
);
desc Attendance;

#iInserting values to Attendance table
INSERT INTO Attendance (id, employee_id, date, status) VALUES
(1, 1, '2025-01-01', 'Present'),
(2, 2, '2025-01-01', 'Absent'),
(3, 3, '2025-01-01', 'On Leave'),
(4, 4, '2025-01-01', 'Present');

SELECT emp1.emp1_name, emp1.emp1_sal
FROM emp1
JOIN dept ON emp1.dept_id = dept.dept_id
WHERE dept.dept_name = 'IT';

SELECT name, budget
FROM Projects
WHERE budget > 50000;

SELECT e.emp1_name AS employee_name, p.name AS project_name
FROM Employee_Projects ep
JOIN emp1 e ON ep.employee_id = e.emp1_id
JOIN Projects p ON ep.project_id = p.id;






