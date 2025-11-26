use hospitaldb;

1--
select * from patient where gender = 'Male'; 

2--
select * from patient where age <= 50 and age >=25; 

3--
select * from doctors where specialization = 'Cardiologist'; 

4--
select * from appointments where status = 'scheduled'; 

5--
select first_name,last_name from patient
where city <> 'chennai'; 