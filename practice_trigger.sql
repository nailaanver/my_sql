use db_trigger;

create table users (
user_id int auto_increment primary key,
username varchar(50),
email varchar (100)
);

insert into users(username,email)
values
('John', 'john@example.com'),
('Alice', 'alice@example.com'),
('David', 'david@example.com');

delimiter //
create procedure ShowAllUsers()
begin
select * from users;
end //
delimiter ;

call ShowAllUsers();

2--  

create table quiz(
quiz_id int auto_increment primary key,
quiz_title varchar (100),
total_questions int);

delimiter //
create procedure AddQuiz(
in p_quiz_title varchar(100),
in p_total_question int
)
begin
insert into quiz(quiz_title,total_questions)
values(p_quiz_title,p_total_question);
end //
delimiter ;

call AddQuiz('python',3);

3 --

create table questions (question_id int auto_increment primary key, 
quiz_id int,
question_text varchar (255));

insert into questions (quiz_id, question_text) values
(1, 'What is MySQL?'),
(1, 'What is a Database?'),
(2, 'What is Python?'),
(1, 'Explain Primary Key.');


delimiter //
create procedure CountQuestions (
in p_quiz_id int)
begin
select count(*) as total_questions
from questions
where quiz_id = p_quiz_id;
end //
delimiter ;
