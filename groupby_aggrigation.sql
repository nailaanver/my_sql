use hospitaldb;

1--
select * from patient 
order by first_name asc; 

2--
select * from doctors
order by specialization asc; 

3--
select * from room
order by price_per_day desc; 

4--
select * from appointments
order by appointment_date asc; 

5--
select * from patient
order by age asc; 

Aggrigation--

1--
select count(*) as total_patients
from patient;  

-- 2
select 
sum(case when gender = 'Male' then 1 else 0 end) as male_count,
sum(case when gender = 'Female' then 1 else 0 end) as female_count
from patient; 

-- 3
select max(price_per_day)
from room; 

-- 4
select min(age)
from patient;

-- 5
select avg(price_per_day)
from room; 