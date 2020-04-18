-- all responses
select q.qNo as QuestionNo, q.question, qat.No as optionNo, qat.option, a.rating,a.ip as Src from question q , question_answer_ip a, question_option_template qat
where a.selected = 1 and
qat.optionid = a.answerid 
and a.questionid= qat.questionid
and q.questionid = qat.questionid
order by 1,5 desc ;


-- confidence per question
select q.qNo as QuestionNo, q.question, avg(a.rating) as rating, avg(a.rating)/3 *100 as "confidence%"  from question q , question_answer_ip a, question_option_template qat
where a.selected = 1 and
qat.optionid = a.answerid  
and a.questionid= qat.questionid
and q.questionid = qat.questionid
group by QuestionNo, q.question;
 
 
 -- confidence per question
select q.qNo as QuestionNo, q.question, qat.No as optionNo, qat.option as answer ,  avg(a.rating) as rating, avg(a.rating)/3 *100 as "confidence%" ,count(*)  as responseNo  from question q , question_answer_ip a, question_option_template qat
where a.selected = 1 and
qat.optionid = a.answerid
and a.questionid= qat.questionid
and q.questionid = qat.questionid
group by QuestionNo, q.question, optionNo,answer;
 