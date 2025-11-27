use hospitaldb;

-- 1 
select specialization, count(*) as doctors_count
from doctors 
group by specialization;

-- 2 
select city, count(*) as patient_city 
from patient
group by city;

-- 3
select status, count(*) as count
from appointments
group by status; 

-- 4
select room_type, count(*) as available_room_type
from room
group by room_type; 

-- 5
select specialization, count(*) as doctors_count
from doctors
group by specialization;

SHOW COLUMNS FROM doctors;



