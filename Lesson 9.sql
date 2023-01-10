-- ДЗ (БД HR)
-- Найти департаменты, в которых больше 10 сотрудников
select 
t1.department_id,
t1.department_name,
t2.cnt
from departments t1
inner join (
select 
department_id,
count(*) as cnt
 from employees
 group by department_id
 having count(*) > 10
 ) t2
 on t1.department_id = t2.department_id;



-- Выведите название департаментов с кол-вом сотрудников выше среднего


select 
department_name
 from departments 
 where department_id in (select
department_id
from employees 
group by department_id
having count(*) > (

select 
    avg(cnt)
  from(
      select 
         department_id,
         count(*) as cnt
      from employees 
      group by department_id
      having department_id is not null
  ) t1
  )
);



-- Найти департамент с наибольшим кол-вом сотрудников (*)

select
   department_id
from employees
group by department_id
having count(*) = (
   select
     max(cnt) as max
from (
    select 
         department_id,
         count(*) as cnt
      from employees 
      group by department_id
      having department_id is not null
      )t1
);

-- Operators case

SELECT 
   count(
       case
         When customer_id > 3 then 1
           else null
     end
  ) as cnt
FROM Customers;

SELECT
   sum(
       case
         When age >= 25 then age
     else 0
     end
  ) as cnt
FROM Customers;

-- Найти сумму amount всех заказов, у которых amount меньше 400 (включая 400) => 1350

  
SELECT
   sum(
       case
         When amount <= 400 
     			then amount
    		 else 0
       end
  ) as ord
FROM Orders;


-- Найти среднее значение amount всех заказов, у которых amount больше 400 (включая 400)

SELECT
   avg(
       case
         When amount < 400 
     			then null
    		 else amount
       end
  ) as ord
FROM Orders;

use hr;
show tables;

select * from employees;

select * from departments;

-- Найти департаменты, в которых есть работники, зарабатывающие больше 10 000. В результате выборки формирует два поля: department_id и 1/0 (1-если есть такие работники, 0 - если нет)

select 
department_id,
   max(
        case
        when salary >= 10000 then 1
        else 0
        end
   ) as sel

from employees
group by department_id;


select 
department_id,
   min(
        case
        when salary >= 10000 then 1
        else 0
        end
   ) as sel

from employees
group by department_id;




select * from departments;
select * from employees;
show databases;
use hr;

show tables;
