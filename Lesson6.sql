CREATE database University;
show databases;
use University;

create table Students(
id   integer primary key auto_increment,
name  varchar(128)  NOT NULL,
age    numeric(2));


-- **Создание таблиц**

-- 1) создать таблицу Students

 -- с полями:

-- id целое число первичный ключ автоинкремент

-- name строка 128 не null

-- age целое число

-- 2) создать таблицу Teachers

-- с полями:

-- id целое число первичный ключ автоинкремент

-- name строка 128 не null

-- age целое число

create table Teachers(
id       integer primary key auto_increment,
name  varchar(128)   NOT NULL, 
age    numeric(2)
);

-- 3) создать таблицу Competencies

-- с полями:

-- id целое число первичный ключ автоинкремент

-- title строка 128 не null

create table Competencies(
id   integer primary key auto_increment,
title varchar(128)
);


-- 4) создать таблицу Teachers2Competencies

-- с полями:

-- id целое число первичный ключ автоинкремент

-- teacher_id целое число

-- competencies_id целое число

create table Teachers2Competencie (
id   integer primary key auto_increment,
teacher_id integer,
competencies_id integer 
);

-- 5) создать таблицу Courses

-- id целое число первичный ключ автоинкремент

-- teacher_id целое число

-- title строка 128 не null

-- headman_id целое число

create table Courses (
id   integer primary key auto_increment,
teacher_id integer,
title varchar(128) NOT NULL,
headman_id integer )
;

-- 6) создать таблицу Students2Courses

-- id целое число первичный ключ автоинкремент

-- student_id целое число

-- course_id целое число


create table Students2Courses (
id   integer primary key auto_increment,
student_id integer,
course_id integer
);

show tables;

--  Добавить 6 записей в таблицу Students

-- Анатолий 29
-- Олег 25
-- Семен 27
-- Олеся 28
-- Ольга 31
-- Иван 22



select * from Students;

-- Добавить 6 записей в таблицу Teachers

-- Петр 39
-- Максим 35
-- Антон 37
-- Всеволод 38
-- Егор 41
-- Светлана 32



-- Добавить 4 записей в таблицу Competencies

-- Математика 
-- Информатика
-- Программирование
-- Графика



-- Добавьте 6 записей в таблицу Teachers2Competencies

-- 1 1
-- 2 1
-- 2 3
-- 3 2
-- 4 1
-- 5 3


-- Добавьте 5 записей в таблицу Courses

-- 1 Алгебра логики 2
-- 2 Математическая статистика 3
-- 4 Высшая математика 5
-- 5 Javascript 1
-- 5 Базовый Python


insert into Students(id, name, age) values (1, 'Анатолий', 29),(2, 'Олег', 25),(3, 'Семен', 27),(4, 'Олеся', 28),(5, 'Ольга', 31),(6, 'Иван', 22);
insert into Teachers(id, name, age) values (1, 'Петр', 39),(2, 'Максим', 35),(3, 'Антон', 37),(4, 'Всеволод', 38),(5, 'Егор', 41),(6, 'Светлана', 32);
insert into Competencies(id, title) values (1, 'Математика'),(2, 'Информатика'),(3, 'Программирование'),(4, 'Графика');
insert into Teachers2Competencie(id, teacher_id, competencies_id ) values (1,1, 1),(2,2, 1),(3,2, 3),(4,3, 2),(5,4, 1),(6,5, 3);
insert into Courses(teacher_id, title, headman_id) values (1, 'Алгебра логики', 2),(2, 'Математическая статистика', 3),(4, 'Высшая математика', 5),(5, 'Javascript', 1),(5, 'Базовый Python', 1);
insert into students2courses(student_id, course_id ) values (1, 1),( 2, 1),(3, 2),(3, 3),(4, 5);     



insert into Students(id, name, age) values (1, 'Анатолий', 29),(2, 'Олег', 25),(3, 'Семен', 27),(4, 'Олеся', 28),(5, 'Ольга', 31),(6, 'Иван', 22);
insert into Courses(teacher_id, title, headman_id) values (1, 'Алгебра логики', 2),(2, 'Математическая статистика', 3),(4, 'Высшая математика', 5),(5, 'Javascript', 1),(5, 'Базовый Python', 1);


-- 6) выведите название курса и имя старосты

select
 t1.title,
 t2.name
from Courses t1
left join Students t2
on t1.headman_id = t2.id;





-- 5) Найдите курс, которые не посещает ни один студент

select
 * 
 from Courses t1
 left join students2courses t2
 on t1.id = t2.course_id 
where t2.course_id is null;






select
 * 
 from Courses t1
 left join students2courses t2
 on t1.id = t2.course_id
 left join Students t3
 on t2.course_id = t3.id
 where t3.id is null;














-- 4) Найдите имена студентов, которые не проходят ни один курс

select 
*
from Students t1
left join students2courses t2
on t1.id = t2.student_id
left join Courses t3 
on t2.course_id = t3.id
where t3.title is null;



-- 3) найдите преподавателя, у которого нет компетенций
select 
t1.name,
t3.title
from Teachers t1
left join Teachers2Competencie t2
on t1.id = t2.teacher_id
 left join Competencies t3
on t2.competencies_id = t3.id
where t3.title is null;





-- 2) выведите имена всех преподавателей с их компетенциями
select 
t1.name,
t3.title
from Teachers t1
left join Teachers2Competencie t2
on t1.id = t2.teacher_id
left join Competencies t3
on t2.competencies_id = t3.id;
                                          
/* 1) вывести имена студентов и курсы, которые они проходят */

select
*
from Students t1
 left join students2courses t2
on t1.id = t2.student_id
 left join Courses t3
on t2.course_id = t3.id;



select * from Students;
select * from Competencies;
select * from Teachers;
select * from students2courses;
select * from Courses;
select * from Teachers2Competencie;




-- ДЗ

-- 8) выведите имя студента и имена старост, которые есть на курсах, которые он проходит


SELECT 
    t1.name AS student_name,
    t3.title AS course_title,
    t4.name AS headman_name
FROM
    Students t1
        INNER JOIN
    students2courses t2 ON t1.id = t2.student_id
        INNER JOIN
    courses t3 ON t2.course_id = t3.id
        INNER JOIN
    students t4 ON t3.headman_id = t4.id;


-- 7) найдите компетенции, которых нет ни у одного преподавателя
SELECT
*
FROM Competencies t1 
left join Teachers2Competencie t2
on t1.id = t2.competencies_id
where t2.competencies_id is null;
