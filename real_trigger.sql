use db_trigger;

create table user_log (
log_id int auto_increment primary key,
user_id int ,
activity varchar(100),
log_time timestamp default current_timestamp
);

delimiter //
create trigger after_answer_insert
after insert on user_answers
for each row 
begin
insert into  user_log (user_id,activity)
values(new.user_id,'User submitted an answer');
end //
delimiter ;

insert into user_answers(user_id,question_id,selected_option_id)
values (3,1,1);

7--

create table user_trigger(
user_id int auto_increment primary key,
username varchar(255),
email varchar(255),
password varchar(8));

delimiter //
create trigger before_user_insert
before insert on user_trigger
for each row 
begin
if (select count(*) from user_trigger where email = new.email) > 0 then
signal sqlstate '45000'
set message_text = 'Error: email already exists!';
end if;
end //
delimiter ;

INSERT INTO user_trigger (username, email, password)
VALUES ('John', 'john@example.com', '12345678');

INSERT INTO user_trigger (username, email, password)
VALUES ('Johny', 'john@example.com', '97780934');

8--

delimiter //
create trigger after_questions_insert
after insert on questions
for each row
begin
update quiz
set total_questions = total_questions + 1
where quiz_id = new.quiz_id;
end//
delimiter ;

INSERT INTO questions (quiz_id, question_text)
VALUES (3, 'What is django?');

INSERT INTO questions (quiz_id, question_text)
VALUES (4, 'What is figma?');

select * from quiz;

9--

delimiter //
create trigger after_question_delete
after delete on questions
for each row
begin
delete from options
where question_id = old.question_id;
end//
delimiter ; 

SET SQL_SAFE_UPDATES = 0;

delete from questions where question_id = 3;

10-- 

create table deleted_users(
user_id int,
username varchar(50),
email varchar(100),
deleted_on timestamp default current_timestamp
);

delimiter //
create trigger after_user_delete
after delete on users
for each row
begin
insert into deleted_users (user_id,username,email)
values (old.user_id,old.username,old.email);
end //
delimiter ;
DELETE FROM users WHERE user_id = 2;
SELECT * FROM deleted_users;

