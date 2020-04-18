-- initialize and clean database
-- you have to start from sequence 1
delete from question_answer_ip;
delete from question_option_template;
delete from question;

ALTER TABLE question_answer_ip AUTO_INCREMENT = 1;
ALTER TABLE question_option_template AUTO_INCREMENT = 1;
ALTER TABLE question AUTO_INCREMENT = 1;


-- Question 1
insert into question values (null,'this is question','123.123.123',1);
select * from question_option_template;

-- possible answers for question 1
insert into question_option_template values (null,1,1,'answer1 toq1','ip1');
insert into question_option_template values (null,1,2,'answer2 toq1','ip1');
insert into question_option_template values (null,1,3,'answer3 toq1','ip1');
insert into question_option_template values (null,1,4,'answer4 toq1','ip1');
insert into question_option_template values (null,1,5,'answer5 toq1','ip1');

-- eric answer
insert into question_answer_ip values (null,'ip1',1,1,3,1);
#chris answer
insert into question_answer_ip values (null,'ip2',1,2,3,1);
insert into question_answer_ip values (null,'ip2',1,1,2,0);
-- third person answer Q1
insert into question_answer_ip values (null,'ip3',1,2,1,1);

---------------------------------------------------------------------
-- question 2
insert into question values (null,'Question 2 is is Friday?','IP3',2);

insert into question_option_template values (null,2,1,'Status True','ip1');
 insert into question_option_template values (null,2,2,'Status False','ip1');

-- eric answer
 insert into question_answer_ip values (null,'ip1',2,6,3,1);
#chris answer
 insert into question_answer_ip values (null,'ip2',2,6,3,1);
 
 -- confidence per question
select q.qNo as QuestionNo, q.question, qat.No as optionNo, qat.option as answer ,  avg(a.rating) as rating, avg(a.rating)/3 *100 as "confidence%" ,count(*)  as responseNo  from question q , question_answer_ip a, question_option_template qat
where a.selected = 1 and
qat.optionid = a.answerid
and a.questionid= qat.questionid
and q.questionid = qat.questionid
group by QuestionNo, q.question, optionNo,answer;
 