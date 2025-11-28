use hospitaldb;

--  Find patient(s) assigned to cardiologist. 
select distinct p.first_name
from patient p
where patient_id in(
select patient_id 
from appointments a 
where doctor_id in(
select doctor_id 
from doctors d 
where specialization = 'Cardiologist')
);

--  Retrieve doctor details having scheduled appointments.
select * from doctors d
where doctor_id in(
select doctor_id  
from appointments a
where a.status = 'Scheduled'); 

--  Show room type with the maximum price.
select r.room_type,r.price_per_day
from room r
where price_per_day = (
select max(price_per_day)
from room
);  

--  Count doctors in the department with highest staff
select count(*) from doctors
where doctor_id in(
select max(doctor_id)
from doctors
);
 




