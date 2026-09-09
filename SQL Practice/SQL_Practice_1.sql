SQL Queries

1.Display all details of employees who are Female.

Select *
from employees
where gender ='F';


2.Display all employees who work in the Sports department.

Select *
from employees
where department ='Sports';

3.Display employees whose salary is greater than 80,000.

Select *
from employees
where salary>80000;

4.Display employees whose salary is less than 50,000.

Select *
from employees
where salary<50000;

5.Display employees whose region_id is 4.

Select *
from employees
where region_id=4;

6.Display employees who are Male and work in the Movies department.

Select *
from employees
where gender='M' and department='Movies';

7.Display employees whose salary is greater than 60,000 and belong to the Clothing department.

Select *
from employees
where salary>60000 and department='Clothing';

8.Display employees who were hired after 2010-01-01

Select *
from employees
where hire_date>'2010-01-01';

9.Display employees who were hired before 2005

Select *
from employees
where hire_date < '2005-01-01';

10.Display employees whose email is NULL.

Select *
from employees
where email IS NULL;         --SQL provides special operators:

                                     IS NULL
                                     IS NOT NULL

                                    If you want employees whose email is NOT NULL
                                    SELECT *
                                   FROM employees
                                  WHERE email IS NOT NULL;

11.Display employees who are Female and whose salary is greater than 90,000.

Select *
from employees
where gender='F' and salary>90000;

12.Display employees who belong to either the Sports or Tools department.

Select *
from employees
where department='Clothing' or department='Beauty';

13.Display employees whose salary is between 50,000 and 80,000.

Select *
from employees
where salary between 50000 and 90000;

14.Display employees who are not in the Sports department.

Select *
from employees
where department not in('Sports');

15.Display employees whose first name is "Sydney".

Select *
from employees
where first_name='Sydney';



Select first_name,salary,hire_date,department
from employees
where salary>100000 
and( hire_date >='2010-01-01' and hire_date<='2012-12-31')
and department not in('Clothing','Tools');

                              OR
and( hire_date between'2010-01-01' and '2012-12-31')

AGGREGATE FUNCTIONS
Select sum(salary)
from employees;

Select avg(salary)
from employees;

Select max(salary)
from employees;

Select min(salary)
from employees;

Select count(salary)
from employees;

Select count(distinct(department))
from employees;

--How to check missing values (blank,null,NaN)--
Select email
from employees
where email is null;

Select email
from employees
where email is not null;

Select count(email)
from employees
where email is not null;
                           COUNT FUNCTION CANNOT COUNT THE NULL VALUES
                             

                          --AGGREGATE FUNCTIONS HAMESHA NUMERICAL COLUMNS PE LAGTA HAI--

--ALL DEPARTMENT WITH THE TOTAL SALARIES--
Select department,sum(salary)
from employees
group by department;

Select gender,count(gender) as Count_of_Employees
from employees
group by gender;

Select department,gender, count(gender)
from employees
group by department , gender
order by department;



--1) HOW MANY UNIQUE SEASONS ARE THERE IN THE TABLE--
Select Count(distinct(season)) 
from fruit_imports;

--2) IN EVERY season show me the count of fruits being imported--
Select season,count(name) 
from fruit_imports
group by season
order by count(name)desc;

--3) For every state show every fruit being imported with their
Select state,name,count(name)
from fruit_imports
group by state,name
order by state;

--4)For every unique fruit give me the total import cost--
Select name,sum(supply*cost_per_unit) as Total_cost
from fruit_imports
group by name;


WHERE CLAUSE - WORKS FOR ROW WISE FILTERING....NOT WORKS ON AGGREGATION

HAVING CLAUSE- WORKS ON AGGREGATED FUNCTIONS (IKKATHA JO KIYA HAI USPE FILTERING KARNA)   

--5)WAQ FRUITS THAT ARE IMPORTED MORE THAN ONCE--

Select name,count(name)
from fruit_imports
group by name
having count(name)>1
order by count(name) desc

--6)WAQ TO FIND ALL SUCH DEPARTMENTS WHERE EMPLOYEE COUNT IS MORE THAN 20--
Select department,count(employee_id)
from employees
group by department
having count(employee_id)>20
order by count(employee_id) desc;

--7)WAQ to find all such departments where count of male employees is more than 20--
Select department,gender,count(gender)
from employees
where gender ='M'
group by department,gender
having count(gender)>20
order by count(gender) desc;



