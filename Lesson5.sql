show databases;
use hr;
show tables;

select * from countries;
select * from departments;
select * from jobs;
select * from locations;
select * from regions;
select * from employees;

SELECT
t1.first_name,
t1.last_name,
t2.department_name
FROM  employees t1
INNER JOIN departments t2
on t1.department_id = t2.department_id;

-- Вывести имя и фамилию сотрудника и название его департамента только тех сотрудников, которые работают в IT, Treasury или IT Support

SELECT
t1.first_name,
t1.last_name,
t2.department_name
FROM employees t1
INNER JOIN departments t2
on t1.department_id = t2.department_id
where department_name IN ('IT', 'Treasury', 'IT Support');

 -- Найти департаменты, в которых никто не работает
 
SELECT 
t1.department_name,
t2.first_name
from departments t1
left join employees t2
on t1.department_id = t2.department_id
where t2.first_name is null;

SELECT 
t1.department_name,
t2.first_name
from departments t1
left join employees t2
on t1.manager_id = t2.manager_id;

-- 4. Выведите названия департаментов и manager_id, в которых менеджеры зарабатывают больше 10000

SELECT distinct
t1.department_name,
t2.manager_id,
t2.salary
from departments t1
inner join employees t2
on t1.department_id = t2.department_id
where t2.salary > 10000;

SELECT 
t1.department_name,
t2.manager_id,
t2.salary
from departments t1
inner join employees t2
on t1.manager_id = t2.employee_id
where t2.salary > 10000;

