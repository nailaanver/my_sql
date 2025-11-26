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

use db_trigger;

call CountQuestions(2);

4--
create table user_answers(
answer_id int auto_increment primary key,
 user_id int,
 question_id int,
 selected_option_id int
 );
 
 create table options (
 option_id int auto_increment primary key,
 question_id int,
 option_text varchar(255),
 is_correct boolean
 );
 
INSERT INTO options (option_id, question_id, option_text, is_correct)
VALUES
-- Question 1 (ID=1)
(1, 1, 'A programming language', TRUE),
(2, 1, 'A snake', FALSE),
(3, 1, 'A fruit', FALSE),

-- Question 2 (ID=2)
(4, 2, 'A database', TRUE),
(5, 2, 'A mobile', FALSE),
(6, 2, 'A laptop', FALSE);

INSERT INTO user_answers (user_id, question_id, selected_option_id)
VALUES
(1, 1, 1), -- Correct (A programming language)
(1, 2, 4); -- Correct (A database)



 delimiter //
 create procedure CalculateUserScore(
 in p_user_id int,
 in p_quiz_id int
 )
 begin
 select u.username,count(*) as total_correct_answers 
 from user_answers ua
 join options o
 on ua.selected_option_id = o.option_id
 join questions q
 on ua.question_id = q.question_id
 join users u
 on ua.user_id = u.user_id
 where ua.user_id = u.user_id
 and q.quiz_id = p_quiz_id
 and o.is_correct = true
 GROUP BY u.username;
 end //
 delimiter ;
 
 


 drop procedure CalculateUserScore;
 
 
INSERT INTO questions (quiz_id, question_text)
VALUES
(3, 'What is Python?'),
(3, 'What is MySQL?');

INSERT INTO options (question_id, option_text, is_correct)
VALUES
(5, 'A programming language', TRUE),
(5, 'A snake', FALSE),
(5, 'A fruit', FALSE),

(6, 'A database', TRUE),
(6, 'A mobile', FALSE),
(6, 'A laptop', FALSE);


INSERT INTO user_answers (user_id, question_id, selected_option_id)
VALUES
(1, 5, 1),
(1, 6, 4);

 
