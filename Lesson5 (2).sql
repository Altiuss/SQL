use hr;

-- 1. Вывести имя и фамилию сотрудника и название его департамента

show tables;
select * from employees;
select * from departments;

SELECT
	t1.first_name,
    t1.last_name,
    t2.department_name
FROM employees t1
INNER JOIN departments t2
ON t1.department_id = t2.department_id;

-- 2. Вывести имя и фамилию сотрудника и название его департамента только тех сотрудников, которые работают в IT, Treasury или IT Support

SELECT
	t1.first_name,
    t1.last_name,
    t2.department_name
FROM employees t1
INNER JOIN departments t2
ON t1.department_id = t2.department_id
WHERE t2.department_name IN ('IT', 'Treasury', 'IT Support'); 

-- 3. Найти департаменты (вывести названия департаментов), в которых никто не работает
-- Вывести все департаменты (left join)
-- Задать условие

SELECT
	t1.department_id,
	t1.department_name
FROM departments t1
LEFT JOIN employees t2
ON t1.department_id = t2.department_id
WHERE t2.first_name IS NULL;

-- 4. Выведите названия департаментов и manager_id, в которых менеджеры зарабатывают больше 10000

SELECT distinct
 t1.department_name
FROM departments t1
INNER JOIN employees t2
ON t1.department_id = t2.department_id
WHERE t2.salary > 10000;

SELECT
 t1.department_name
FROM departments t1
INNER JOIN employees t2
ON t1.manager_id = t2.employee_id
WHERE t2.salary > 10000;

-- ДЗ

-- 5. Вывести имя и фамилию сотрудников, которые работают в Seattle или Toronto

