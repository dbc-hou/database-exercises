use david;
-- Create the database and four tables:
-- one user, many ads
-- many categories, many ads (via ad_category)

create database quizbanger;

create table administrators
(
    id       int unsigned not null auto_increment,
    admin_email    varchar(100),
    admin_first_name varchar(50),
    admin_last_name varchar(75),
    admin_password varchar(32),
    primary key (id)
);

create table students
(
    id int unsigned not null auto_increment,
    stu_email    varchar(100),
    stu_first_name varchar(50),
    stu_last_name varchar(75),
    stu_password varchar(32),
    primary key (id)
);

create table quizzes
(
    id int unsigned not null auto_increment,
    quiz_name varchar(100),
    quiz_time_limit int,
    quiz_admin int,
    primary key (id)
);

create table questions
(
    id int unsigned not null auto_increment,
    q_stem varchar(255),
    q_correct_answer text,
    primary key (id)
);

create table quiz_questions
(
    quiz_id int,
    question_id int,
    primary key (quiz_id, question_id),
    foreign key (quiz_id) references quizzes(id),
    foreign key (question_id) references questions(id)
)

create table student_quizzes
(
    id int unsigned not null auto_increment,
    student_id int,
    quiz_id int,
    completed tinyint,
    primary key (id),
    foreign key (student_id) references students(id),
    foreign key (quiz_id) references quizzes(id)
)

create table student_questions
(
    id int unsigned not null auto_increment,
    student_id int,
    question_id int,
    quiz_id int,
    student_answer text,
    primary key (id),
    foreign key (student_id) references students(id),
    foreign key (question_id) references questions(id),
    foreign key (quiz_id) references quizzes(id),
)

create table admin_questions
(
    admin_id int,
    question_id int,
    primary key (admin_id, question_id),
    foreign key (admin_id) references administrators(id),
    foreign key (question_id) references questions(id)
)

-- Display student's answers for comparison with correct answers
-- with a formula showing whether each answer is correct
select concat(s.id, ' - ', s.stu_first_name,' ',s.stu_last_name) as Student,
        qz.quiz_title as 'Quiz Title',
        q.q_stem as Question
        q.q_correct_answer as 'Correct Answer',
        sq.student_answer as 'Student''s Answer',
        if(q.q_correct_answer = sq.student_answer,'Yes','No') as 'Correct?'
from students s
    join student_questions sq on s.id = sq.student_id
    join questions q on sq.question_id = q.id
    join quiz_questions qq on q.id = qq.question_id
    join quizzes q2 on qq.quiz_id = qz.id
where s.id = [parameter]
    and q.id = [parameter]
)

select concat(s.id, ' - ', s.stu_first_name,' ',s.stu_last_name) as Student,
       count(if(q.q_correct_answer = sq.student_answer,'Yes','No'))
