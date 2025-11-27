use hospitaldb;

-- 1
select p.first_name as patient_name,d.name as doctor_name
from patient p
join appointments a on a.patient_id = p.patient_id
join doctors d on a.doctor_id = d.doctor_id;

-- 2
select a.appointment_date,d.specialization
from doctors d
join appointments a on d.doctor_id = a.doctor_id;

-- 3
select p.first_name as patient_name,
p.city as patient_city,d.name as assigned_doctor
from patient p
join appointments a on p.patient_id = a.patient_id
join doctors d on d.doctor_id = a.doctor_id;

-- 4
select d.name as doctor_name,
dept.department_name as depratement_name
from doctors d
join department dept on d.doctor_id = dept.department_id;  

-- 5
select 
concat(p.first_name,' ', p.last_name) as patient_full_name,
a.status 
from appointments a
join patient p on a.patient_id = p.patient_id;


 