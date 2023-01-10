use hr;
select * from employees;
-- Вывести имя/фамилию сотрудника и имя/фамилию его/ее менеджера

-- t1 - источник данных о сотруднике
-- t2 - источник данных о менеджере

select
 t1.first_name as vards,
 t1.last_name as uzvards,
 t1.manager_id, 
 t2.employee_id,
 t2.first_name as menengerVards,
 t2.last_name as menengeraUzvards
 from employees t1
inner join employees t2
on t1.manager_id = t2.employee_id;

-- Вывести имена и фамилии тех сотрудников, которые зарабатывают больше своего менеджера

select
 t1.first_name as vards,
 t1.last_name as uzvards,
 t1.salary,
 t2.salary,
 t1.manager_id, 
 t2.employee_id,
 t2.first_name as menengerVards,
 t2.last_name as menengeraUzvards
 from employees t1
inner join employees t2
on t1.manager_id = t2.employee_id
where t1.salary > t2.salary;


/*
 АГРЕГАЦИЯ
 1. count() - кол-во строк, которые не null
 2. max() - максимальное значение
 3. min() - минимальное значение
 4. avg() - среднее значение
 5. sum() - сумма значений
 */
select 
first_name,
min(salary) as max_salary
from employees;

SELECT 
	first_name,
	last_name,
	avg(salary) as max_salary
FROM employees;




select 
last_name,
first_name,
min(salary) as min_salary
from employees;

select 
    First_name,
    last_name,
    salary
    from employees
    where salary = (
    select 
min(salary) as max_salary
from employees
);
    