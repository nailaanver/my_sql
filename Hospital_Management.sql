create database HospitalDB;
use HospitalDB;

create table patient(
patient_id int auto_increment primary key,
first_name varchar(50),
last_name varchar(50),
age int,
gender varchar(10),
city varchar(50));

insert into patient (patient_id, first_name, last_name, age, gender, city) values
(1, 'Aarav', 'Sharma', 30, 'Male', 'Delhi'),
(2, 'Diya', 'Singh', 25, 'Female', 'Mumbai'),
(3, 'Rahul', 'Verma', 40, 'Male', 'Chennai'),
(4, 'Sneha', 'Nair', 32, 'Female', 'Kochi'),
(5, 'Mukesh', 'Gupta', 55, 'Male', 'Kolkata');

create table doctors (
doctor_id int auto_increment primary key,
name varchar(100),
specialization varchar(100),
phone varchar(15));

insert into doctors (doctor_id, name, specialization, phone) values
(1, 'Dr. Anil Kumar', 'Cardiologist', '9876543210'),
(2, 'Dr. Priya Rao', 'Neurologist', '9988776655'),
(3, 'Dr. John Mathew', 'Orthopedic', '9876001234'),
(4, 'Dr. Neha Sharma', 'Pediatrician', '9123456780'),
(5, 'Dr. Manoj Varma', 'Surgeon', '9090909090');

create table department (
department_id int auto_increment primary key,
department_name varchar(100));

insert into department (department_id, department_name) values
(1,'Cardiology'),
(2,'Neurology '),
(3,'Orthopedics '),
(4,'Pediatrics '),
(5,'General Surgery ');

create table appointments(
appointment_id int auto_increment primary key,
patient_id int,
doctor_id int,
appointment_date date,
status varchar(20),
foreign key (patient_id) references patient(patient_id),
foreign key (doctor_id) references doctors(doctor_id)
);

insert into appointments 
(appointment_id, patient_id, doctor_id, appointment_date, status) 
values
(1, 1, 1, '2025-10-20', 'Completed'),
(2, 2, 2, '2025-10-21', 'Scheduled'),
(3, 3, 3, '2025-10-22', 'Completed'),
(4, 4, 4, '2025-10-25', 'Scheduled'),
(5, 5, 5, '2025-10-18', 'Cancelled');

create table room(
room_id int auto_increment primary key,
room_type varchar(100),
price_per_day int
);

insert into room(room_id,room_type,price_per_day)
values
(1,'General Ward',1500),
(2,'Private Room',3000),
(3,'ICU ',7500),
(4,'General Ward ',1500),
(5,'ICU',7500);




