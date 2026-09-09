Practice Questions
Select * from employees
Select * from departments
--Q1. Display the employee's first name, department, and division for employees whose 
--department has a corresponding record in the departments table.

Select e.first_name, e.department , d.division
from employees e
inner join departments d
on e.department = d.department


--Q2. Display all employees along with their department division. 
--Employees whose department does not exist in the departments table should also appear.

Select e.first_name , e.department , d.division
from employees e
left join departments d
on e.department = d.department

--Q3. Display all departments along with the employee names working in them. 
--Departments with no employees should also be displayed.

Select e.first_name, d.department
from employees e
right join departments d
on e.department = d.department

--Q4. Display all employees and all departments, including employees whose 
--departments don't exist in the departments table and departments that have no employees.

Select e.first_name, d.department
from employees e
full join departments d
on e.department = d.department

--Q5. Display every student along with the course number they have enrolled in. 
--Students who have not enrolled in any course should also appear.

Select * from students
Select * from student_enrollment
Select * from courses

Select s.student_name , se.course_no 
from students s
left join student_enrollment se
on s.student_no = se.student_no 

--Q6. Display student name, course title, and credits for students who are enrolled in a course.
Select * from students
Select * from student_enrollment
Select * from courses
Select * from teach
Select * from professors

Select student_name, course_title, credits
from students s
inner join student_enrollment se
on s.student_no = se.student_no
inner join courses c
on se.course_no = c.course_no

--Q7. Display every professor along with every course available in the courses table.

Select p.last_name , c.course_title
from professors p
cross join courses c

--Q8. Display the student name, course title, and professor's last name for every enrollment.

Select s.student_name , c.course_title , t.last_name
from students s
inner join student_enrollment se
on s.student_no = se.student_no
inner join courses c
on se.course_no = c.course_no
inner join teach t
on c.course_no = t.course_no


--Q9. Display all professors along with the courses they teach.
--Professors who currently don't teach any course should also appear.

Select p.last_name , t.course_no
from teach t
right join professors p
on t.last_name = p.last_name



--Q10. Display all courses along with the professors who teach them. 
--Courses that are not currently taught by any professor should also appear.

Select c.course_title , t.last_name
from courses c
left join teach t
on c.course_no = t.course_no

--Q11. Display every employee with every department, showing the employee's 
--first name and department name.

Select * from employees

Select e.first_name , e.department
from employees e
cross join departments d

--Q12. Display the student name and professor's last name for students
--taking courses taught by that professor.

SELECT s.student_name, t.last_name
FROM students s
INNER JOIN student_enrollment se
    ON s.student_no = se.student_no
INNER JOIN teach t
    ON se.course_no = t.course_no;
