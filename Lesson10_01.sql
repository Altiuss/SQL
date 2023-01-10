-- 1. Отсортируйте данные о билетах в зависимости от цены по возрастанию.
-- В выборке должны присутствовать три атрибута — id, trip_id, price.
use airport;

select * from
airport;

show tables;

select 
id,
 trip_id,
price
from
tickets
order by price;

-- 2. Отсортируйте данные о билетах в зависимости от цены по возрастанию. 
-- Если некоторые билеты имеют одинаковую цену, отсортируйте вхождения по trip_id по убыванию. 
-- Если и цена, и trip_id одинаковые, отсортируйте вхождения по номеру билета по возрастанию.
-- В выборке должны присутствовать три атрибута — id, trip_id, price.

select 
id,
trip_id,
price
from
tickets
order by price, trip_id desc, id;

-- 3. Менеджеры авиакомпании потребовали выяснить количество различных моделей самолетов. 
-- Выведите все доступные модели, исключая дубликаты.
-- В выборке должен присутствовать один атрибут — model_name.

select distinct
model_name
 from
airliners;

select * from
airliners;

select * from
clients;

select * from
tickets;

select * from
trips;


-- 4. Аналитическое подразделение решило уточнить у авиакомпании количество билетов не бизнес-класса.
-- Напишите запрос, который выведет id билетов, класс обслуживания в которых отличен от бизнес-класса (Business).
-- В выборке должен присутствовать один атрибут —  id.

select 
id,
service_class
 from
tickets
where service_class != 'Business';


-- 5. Напишите запрос, который выведет id клиентов, чье значение атрибута name начинается на Daria.
-- В выборке должен присутствовать один атрибут — id.

select 
id,
name from
clients
where name like 'Daria%';

-- 6. Определите рейсы с точкой назначения в аэропортах, коды которых PEZ, MMK и VKO.
-- В выборке должен присутствовать один атрибут — id.

select id from
trips  
where arrival in ('PEZ', 'MMK', 'VKO');

-- 7. Определите id рейсов, которые должны были вылететь из аэропорта Домодедово (DME), но были отменены.
-- В выборке должен присутствовать один атрибут — id.

select id 

 from
trips  
where status in ('Cancelled')
and arrival in ('DME');

select id ,
status
 from
trips  
where arrival in ('DME')
;

-- 8. Определите имена и фамилии пассажиров, чьи идентификаторы заканчиваются на RCB или FCV, а номера телефонов не начинаются на +705.
-- В выборке должен присутствовать один атрибут — name.


select 
name, id
 from
clients
where (id like '%RCB' or id like '%FCV')
and phone not like '+705';

-- 9. Разделите самолеты на три класса по возрасту. 
-- Если самолет произведен раньше 2000 года, то отнесите его к классу 'Old'. 
-- Если самолет произведен между 2000 и 2010 годами включительно, то отнесите его к классу 'Mid'. 
-- Более новые самолеты отнесите к классу 'New'. 
-- Исключите из выборки дальнемагистральные самолеты с максимальной дальностью полета больше 10000 км. 
-- Отсортируйте выборку по классу возраста в порядке возрастания.
-- В выборке должны присутствовать два атрибута — side_number, age.

select 
model_name,
side_number,

case
        when production_year < 2000  then 'Old'
        when production_year >= 2000 and production_year <= 2010 then 'Mid'
        else 'New'
	   end as age
  from airliners 
  where range_ < 10000
  order by age ;


select * from
tickets;

-- 10. Руководство авиакомпании снизило цены на билеты рейсов LL4S1G8PQW, 0SE4S0HRRU и JQF04Q8I9G. 
-- Скидка на билет экономкласса (Economy) составила 15%, на билет бизнес-класса (Business) — 10%, а на билет комфорт-класса (PremiumEconomy) — 20%. 
-- Определите цену билета в каждом сегменте с учетом скидки.
-- В выборке должны присутствовать три атрибута — id, trip_id, new_price.

select 
id,
trip_id,

case
        when service_class = ('Economy')   then price *  0.85
        when service_class = 'Business'  then price *  0.9
        else price *  0.8
	   end as new_price
  from tickets 
 where trip_id in ( 'LL4S1G8PQW', '0SE4S0HRRU',  'JQF04Q8I9G');
 
 -- 11. После каждого рейса проходит плановая уборка салона. Результаты уборки вносятся в отчет-лист. 
-- Авиакомпания получила отчет, в котором указано, что во всех самолетах все места чистые, а спинки кресел исправные.
-- Выведите бортовой номер самолета, cформировав для каждой строки поле index с значением 'clean'.
-- В выборке должны присутствовать два атрибута — side_number и index.

select
side_number,
  'clean' as indeks
 from airliners;
 
 -- 12. Найдите коды всех рейсов, которые прибыли в пункт назначения и идентификатор которых начинаются на 'Y'. 
-- Название столбца в выборке должно быть flight. Отсортируйте выборку по коду рейса в порядке возрастания.
-- В выборке должен присутствовать один атрибут — flight.

select 
trip_code as flight
from trips
where status = 'Arrived' and id like 'Y%'
order by flight;

select * from
airliners;

-- 13. Выведите среднюю дальность полета самолетов марки Airbus, которые были выпущены в 2008 году или позже. 
-- Название моделей самолетов начинается с названия компании-производителя. Например, Airbus A320-200.
-- В выборке должен присутствовать один атрибут — avg_range.

select
 avg(range_) as avg_range
 from
airliners 
where production_year >= 2008 and model_name like 'Airbus%';

-- 14. Руководство авиакомпании снизило цены на билеты рейсов OZAO28DLFP, 5QMWLJ4SOC и 8RF8OIOVFR. 
-- Скидка на билет экономкласса (Economy) составила 15%, на билет первого класса (FirstClass) — 10%, а на билет комфорт-класса (PremiumEconomy) — 20%.
-- Найдите затраты авиакомпании на акцию, то есть разность стоимости всех билетов и стоимости всех билетов с учетом скидки.
-- В выборке должен присутствовать один атрибут — expenses.

SELECT 
    SUM(CASE
        WHEN service_class = 'Economy' THEN price * 0.15
        WHEN service_class = 'FirstClass' THEN price * 0.1
        WHEN service_class = 'PremiumEconomy' THEN price * 0.2
    END) AS expenses
FROM
    tickets
WHERE
    trip_id IN ('OZAO28DLFP' , '5QMWLJ4SOC', '8RF8OIOVFR');



SELECT 
    SUM(CASE
        WHEN service_class = ('Economy') THEN price * 0.85
        WHEN service_class = 'Business' THEN price * 0.9
        ELSE price * 0.8
    END) AS expenses
FROM
    tickets
WHERE
    trip_id IN ('OZAO28DLFP' , '5QMWLJ4SOC', '8RF8OIOVFR');