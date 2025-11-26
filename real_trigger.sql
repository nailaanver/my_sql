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


