create database practice;
use practice;
create table department(id varchar(10) primary key, dname varchar(40),mgreno int);
alter table department drop column id;
alter table department add dno varchar(10);
alter table department modify dno varchar(20) primary key;
insert into department(dno,dname,mgreno)
values ('D1','Consulting',1001),
       ('D2','Development',1002),
       ('D3','Reserch',1003);
       
create table employee (eno int,ename varchar(40),bdate date,title varchar(255),salary int,dno varchar(40),foreign key(dno) references department(dno));
insert into employee (eno,ename,bdate,title,salary,dno)
values(1001,'Alice','1980-03-10','Manager',85000,'D1'),
      (1002,'Bob','1985-07-14','EE',40000,'D2'),
      (1003,'Charlie','1990-01-20','SA',37000,'D1'),
      (1004,'David','1988-09-12','EE',32000,'D2'),
      (1005,'Eve','1992-11-05','Manager',90000,'D3');
      
ALTER TABLE employee ADD PRIMARY KEY (eno);

create table project(pno int primary key,pname varchar(255), budget int, dno varchar(40),foreign key (dno) references department(dno));
insert into project (pno,pname,budget,dno) values
(501,'Alpha',120000,'D1'),
(502,'Beta',45000 ,'D2'),
(503,'Gamma',75000,'D3'),
(504,'Delta',200000,'D1');

create table workson (eno int primary key, pno int,foreign key (pno) references project(pno),resp varchar(255),hours int);
insert into workson (eno,pno,resp,hours) values
(1001,501,'Manager',15),
(1002,502,'Developer',8),
(1003,501,'Consultant',12),
(1004,503,'Tester',9),
(1005,504,'Manager',18);

select pno,pname from project where budget > 100000;
select resp from workson where hours < 10 and resp = 'Manager';
select * from workson where hours < 16 and resp = 'Manager';
select eno,ename from employee where (title = 'EE' or title = 'SA' ) and salary > 35000;
select ename from employee where dno = 'D1'
order by salary desc;
select * from department 
order by dname asc;

select e.ename,d.dname,e.title 
from employee e
join department d on e.dno = d.dno; 
select p.pname, w.hours ,p.pno 
from project p
join workson w on p.pno = w.pno
where w.hours < 10; 
select p.pname,d.dname,p.budget
from project p 
join department d on d.dno = p.dno
where budget < 50000;

select e.eno,e.salary from employee e
join department d on e.dno = d.dno
where d.dname = 'Consulting'
order by e.salary desc;

select e.ename,p.pname,e.title,w.hours
from workson w
join employee e on w.eno = e.eno
join project p on w.pno = p.pno;









