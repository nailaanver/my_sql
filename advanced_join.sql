use hospitaldb;

-- Show only completed appointments with doctor & patient name.
select a.appointment_id,d.name as doctor_name,
p.first_name as patient_name,
a.status
from appointments a
join doctors d on  d.doctor_id = a.doctor_id
join patient p on  p.patient_id = a.patient_id
where a.status = 'Completed'; 

--  List department names with doctors working in them.
select dept.department_name,d.name
from doctors d
join department dept on d.doctor_id = dept.department_id;

--  Show all cancelled appointments with patient details 
select  p.first_name,p.age,p.gender,p.city,a.status
from appointments a
join patient p on p.patient_id = a.patient_id
where a.status = 'Cancelled';

-- Show appointments for patients older than 35 years.
select p.first_name as patient_name,p.age,p.gender,p.city,a.appointment_id,a.appointment_date,a.status
from appointments a
join patient p on p.patient_id = a.patient_id
where p.age > 35; 

-- Retrieve doctor phone number for each appointment. 
select a.appointment_id,a.appointment_date,d.name as doctor_name,d.phone as doctor_no
from appointments a
join doctors d on d.doctor_id = a.doctor_id; 
