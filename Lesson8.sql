select 
avg(salary)
from employees;

use hr;
-- Найти сотрудников, у которых зарплата меньше средней
select 
first_name,
last_name,
salary
from employees
WHERE salary < (
select 
avg(salary)
from employees);

-- 2) Найти количество сотрудников в каждом департаменте

select 
department_id,
count(*)
from employees
WHERE department_id is not null
group by department_id;

select
t1.department_name,
count(*) as employee_count
from departments t1
left join Employees t2
on t1.department_id = t2.department_id
group by t1.department_name;


-- 3) Найти количество сотрудников у каждого менеджера

select
manager_id,
count(*)
from employees
group by manager_id;


select 
t1.manager_id,
t2.first_name,
t2.last_name,
count(*)
from employees t1
inner join employees t2
on t1.manager_id = t2.employee_id
group by t1.manager_id;

select
	t1.manager_id,
    t2.first_name,
    t2.last_name,
	count(t1.employee_id)
from employees t1
inner join employees t2
on t1.manager_id = t2.employee_id
group by t1.manager_id;

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''))

select 
first_name,
last_name,
max(age) as max_age
from customers;


 
select 

count(*) as orders_amont
from orders;


-- Найти средний amount в orders


select 
avg(amount) as avg_amont
from orders;



-- Найти amount каждого товара


select 
item,
sum(amount) as total_amount
from orders
group by item;


-- Найти средний возраст покупателей из UK



select 
country,
avg(age) as avg_age
from Customers
where country in ('UK');

Найти средний возраст покупателей из UK i USA


select 
country,
avg(age) as avg_age
from Customers
where country in ('UK', 'USA')
group by country;


-- Найти страны, в которых средний возраст покупателей больше или равен 25

select 
country,
avg(age) as AVG_age
from customers
group by country
having avg(age) >= 25;


-- Найти тех покупателей, у которых средний amount больше или равен 400

---- s where

select
t1.first_name,
t1.last_name,
t2.avg_amount

from customers t1
inner join (select
            customer_id,
            avg(amount) as avg_amount
            from Orders 
            group by customer_id)
            t2
            on t1.customer_id = t2.customer_id
            where avg_amount >= 400;



---- s having


select 
t1.first_name,
t1.last_name,
t2.avg_amount
from customers t1
inner join (
  select
  customer_id, avg(amount) as avg_amount
  from orders
  group by customer_id
  having avg(amount) >= 400
  ) t2
  on t1.customer_id = t2.customer_id;


-- Найти средний amount у каждого покупателя

-- найти средний amount по customer_id
-- сделать join с customers по customer_id



select
t1.first_name,
t2.AVG_AMOUNT
from customers t1
inner join (
select
customer_id,
avg(amount) as AVG_AMOUNT
from orders
group by customer_id
) t2 
on t1.customer_id = t2.customer_id;


select
t2.first_name,
t2.last_name,
avg(amount) as avg_amount
from Orders t1
inner join Customers t2
on t1.customer_id = t2.customer_id
group by t1.customer_id;


-- ДЗ (БД HR)
-- Найти департаменты, в которых больше 10 сотрудников
-- Выведите название департаментов с кол-вом сотрудников выше среднего
-- Найти департамент с наибольшим кол-вом сотрудников

