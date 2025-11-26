create database practical_with_data;
use practical_with_data;
create table departments (dept_id int auto_increment primary key,dept_name varchar(255));
insert into departments(dept_name) values ('HR'),
												  ('IT'),
                                                  ('Finance');
create table employees (emp_id int primary key, emp_name varchar(255), salary int, dept_id int,foreign key(dept_id) references departments(dept_id),join_date date);
insert into employees (emp_id,emp_name,salary,dept_id,join_date) values
(101,'Alice',75000,2,'2022-04-10'),
(102,'Bob',60000,1,'2019-12-20'),
(103,'Charlie',82000,3,'2022-04-10'),
(104,'David',55000,2,'2022-04-10'),
(105,'Eva',90000,3,'2022-04-10');
select emp_name,salary from employees; 
select * from employees where salary > 60000;
select * from employees where join_date > '2021-01-01';
select * from employees where dept_id = 3;
select * from employees where emp_name like 'A%';

update employees e
join departments d on e.dept_id = d.dept_id
set e.salary = e.salary * 1.10
where d.dept_name = 'HR';

set SQL_SAFE_UPDATES=0;
update employees
set dept_id = 3
where Emp_name = 'Bob ';

delete from employees 
where join_date < '2020-01-01' and emp_id > 0;

delete from employees where emp_id = 104;

update employees 
set salary = salary + 1000
where dept_id = 3;

select sum(salary) as total_expence
from employees;

select dept_id,avg(salary) as avarage_salary
from employees
group by(dept_id);

select max(salary) as highest_salary
from employees;

select count(*) as total_employees
from employees;

select min(salary) as minimum_salary
from employees 
where dept_id = 3;

set SQL_SAFE_UPDATES=0;
select dept_id,count(*) as total_employees
from employees
group by(dept_id);

select e.emp_name,d.dept_name
from employees e
join departments d on e.dept_id = d.dept_id;

select d.dept_name,e.emp_name
from departments d
left join employees e on d.dept_id = e.dept_id;

use practical_with_data;
select e.emp_name,d.dept_name
from departments d
right join employees e on d.dept_id = e.dept_id;

SELECT e.emp_id, e.emp_name, d.dept_name,e.salary, e.join_date
FROM employees e
LEFT JOIN departments d 
ON e.dept_id = d.dept_id

UNION

SELECT e.emp_id, e.emp_name, d.dept_name,e.salary, e.join_date
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

select d.dept_name
from departments d
left join employees e
on d.dept_id = e.dept_id
where e.dept_id is null;

select * from employees 
where salary > (
select avg(salary)
from employees );

select e.emp_id,e.emp_name,e.dept_id,e.salary
from employees e 
where e.salary = (
select max(salary)
from employees
where dept_id = e.dept_id
);

select * from employees 
where dept_id in (
select dept_id 
from departments
where dept_name in ('IT','HR'));

select emp_name from employees 
where dept_id = (
select dept_id 
from departments 
where dept_name = 'finance');


select d.dept_id,d.dept_name
from departments d
where (
select max(e.salary)
from employees e
where e.dept_id = d.dept_id
) > 60000;

