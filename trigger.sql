create database db_trigger;
use db_trigger;

create Table employees(
employee_id int auto_increment primary key,
name varchar(100),
salary decimal(10,2),
department varchar(50)
);

create table employee_log(
log_id int auto_increment primary key,
emp_id int,
action varchar(50),
log_time datetime
);

DELIMITER //
create procedure AddEmployee(
in emp_name varchar(100),
in emp_salary decimal(10,2),
in emp_dept varchar(50)
)
begin
insert into employees (name,salary,department)
values(emp_name,emp_salary,emp_dept);
end //
DELIMITER ;

DELIMITER //
create trigger after_employee_insert
after insert on employees
for each row
begin
insert into employee_log(emp_id,action,log_time)
values(new.employee_id,'inserted',now());
end//
DELIMITER ;

call AddEmployee ('John Doe',55000.00,'HR');

select * from employees;

select * from employee_log;