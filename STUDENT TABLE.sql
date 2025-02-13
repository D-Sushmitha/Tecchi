STUDENT TABLE:-


create database result;
use result;

create TABLE student2(
Stu_ID INT PRIMARY KEY,
Stu_Name VARCHAR(50),
Stu_Dept VARCHAR(50),
Stu_Marks INT
);
desc student2;

INSERT INTO student2 VALUES
(500,'Kani','BCA',96),
(501,'Shanthi','BSC',87),
(502,'Anitha','BCom',94),
(503,'Ash','BA',98),
(504,'Keerthu','BE',67);

desc student2;
select * from student2;
SELECT min(Stu_Marks) AS MinimumMarks FROM student2;
Select max(Stu_Marks) As MaximumMarks From student2;
Select avg(Stu_Marks) As AverageMarks from student2;

select * from student1;


			