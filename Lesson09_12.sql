-- ДЗ
-- 1. Определить сколько покупок было совершено в июне
-- 2. Определить среднюю стоимость покупок в марте
-- 3. Определить какие покупки были совершены во вторник
-- 4. Определить, сколько покупок было совершено в каждый месяц. Отсортировать строки в порядке возрастания количества покупок. Вывести два поля - номер месяца и количество покупок
-- 5. * Определить, в какой месяц было совершено больше всего покупок.  Вывести два поля - номер месяца и количество покупок

use shop;

select * from SELLERS;
select * from CUSTOMERS ;
select * from orders ;




-- Определить сколько покупок было совершено в июне

select count(*) as pokupki
	
from orders
where month(odate) = 6;

-- 2. Определить среднюю стоимость покупок в марте

select round(avg(AMT), (2)) as avg_v_marte
	
from orders
where month(odate) = 3;

-- 3. Определить какие покупки были совершены во вторник

select 
*
 from orders
 where weekday(odate) = 1;
 
 
 -- 4. Определить, сколько покупок было совершено в каждый месяц. Отсортировать строки в порядке возрастания количества покупок. Вывести два поля - номер месяца и количество покупок

select 
month(odate) as month,
count(*) as cnt
 from orders
group by  month(odate)
order by cnt;

---------------------------------------------------------------------------------------------------
create view v_march as 
select
*
from orders 
where month(odate) = 3;

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
select 
*
from v_march;





drop view v_march;

-- ---------------------------------------------------------------------------------------------

-- 5. * Определить, в какой месяц было совершено больше всего покупок.  Вывести два поля - номер месяца и количество покупок

select 
month(odate) as month,
count(*) as count
 from orders
group by  month(odate)
order  by count desc limit 1;




create view v_all_month as
select
	monthname(odate) as month_name,
    count(*) as cnt
from orders
group by month_name;

select
	*
from v_all_month
where cnt = (select max(cnt) from v_all_month);





create view v_max_bys as 
select
month(odate) as month,
count(*) as count
 from orders
group by  month(odate);

select
	*
from v_max_boys
where count = (select max(count) from v_max_boys);

