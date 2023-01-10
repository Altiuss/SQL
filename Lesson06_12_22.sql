use airport;

   select * from tickets; 
    select * from airliners;
    
    -- Отсортируйте данные о билетах в зависимости от цены по возрастанию. В выборке должны присутствовать три атрибута — id, trip_id, price.

    
    
    select 
     id,
     trip_id,
     price
     from tickets
     order by price;

-- Менеджеры авиакомпании потребовали выяснить количество различных моделей самолетов. Выведите все доступные модели, исключая дубликаты.
-- В выборке должен присутствовать один атрибут — model_name.


select distinct
model_name
from airliners;

-- Аналитическое подразделение решило уточнить у авиакомпании количество билетов не бизнес-класса.
-- Напишите запрос, который выведет id билетов, класс обслуживания в которых отличен от бизнес-класса (Business).
-- В выборке должен присутствовать один атрибут —  id.


select id 
from tickets
where service_class not in ('Business'); 

select id 
from tickets
where service_class != 'Business';

-- Посчитать количество полученный id билетов в предыдущем запросе


select 
service_class,
count(*) as cnt
from tickets
where service_class != 'Business'
group by service_class
order by cnt desc;                                           -- asc preteji


-- Определите модели самолетов, максимальная дальность полета (range) которых находится в диапазоне от 4200 до 12000 включительно.
-- В выборке должен присутствовать один атрибут —  model_name.



select 
model_name
from airliners
where range_ between 4200 and 10000;

-- Номера некоторых билетов рейса RL6EC4YWB1 внесены в базу некорректно: два последних символа билетов серии UE01H8UCJQXX введены неправильно. 
-- То есть на месте символов XX находятся некорректные значения. Номера некоторых билетов имеют значение NULL. 
-- Найдите идентификаторы пассажиров всех некорректно введенных билетов.
-- В выборке должен присутствовать один атрибут — client_id.

 select * from tickets; 

  select client_id
  from tickets
  where trip_id = 'RL6EC4YWB1'
  and ((id like "UE01H8UCJQ__") or id is null); 
  
  -- Для каждого самолета модели Cessna 172 выведите дальность полета. Имя столбца с результатом должно быть max_distance.
-- В выборке должен присутствовать один атрибут — max_distance.

 select * from airliners;
  
  select range_ as max_distance
  from airliners
  where model_name = 'Cessna 172'
  ;
  
  
  -- Разделите самолеты на ближне-, средне- и дальнемагистральные. 
-- Ближнемагистральными будем считать самолеты, дальность полета которых > 1000 км и <= 2500 км. 
-- Среднемагистральными — с дальностью полета > 2500 км и <= 6000 км. 
-- Дальнемагистральными — с дальностью полета > 6000 км. 
-- В выборке должно быть два столбца, где в первом указана модель самолета. 
-- Во втором, category, — категория, со значениями short-haul, medium-haul, long-haul (ближне-, средне- и дальнемагистральные соответственно). 
-- Каждый самолет точно попадает ровно в одну категорию.
-- В выборке должны присутствовать два атрибута — model_name, category.


select 
model_name,
case
        when range_ > 1000 and range_ <= 2500 then 'short-haul'
        when range_ > 2500 and range_ <= 6000 then 'medium-haul'
        when range_ > 6000  then 'long-haul'
	   end category
  from airliners;
  
  -- Если максимальная дальность полета <= 1000 км или данных о дальности полета нет, в category выведите 'UNDEFINED'.

select 
model_name,
case
        when range_ > 1000 and range_ <= 2500 then 'short-haul'
        when range_ > 2500 and range_ <= 6000 then 'medium-haul'
        when range_ > 6000  then 'long-haul'
        else 'UNDEFINED'
	   end category
  from airliners;
  
  -- Выведите данные о билетах разной ценовой категории. 
-- Среди билетов экономкласса (Economy) добавьте в выборку билеты с ценой от 10 000 до 11 000 включительно. 
-- Среди билетов комфорт-класса (PremiumEconomy) — билеты с ценой от 20 000 до 30 000 включительно. 
-- Среди билетов бизнес-класса (Business) — с ценой строго больше 100 000. 
-- В решении необходимо использовать оператор CASE.
-- В выборке должны присутствовать три атрибута — id, service_class, price.

select * from tickets;



        
        select 
	id,
    service_class,
    price
from tickets
where
	case service_class
		when 'Business' then price > 100000
        when 'PremiumEconomy' then price between 20000 and 30000
        when 'Economy' then price between 10000 and 20000
    end;
    
    select date ('2022-12-06 11:59:30');
    
     select weekday ('2022-12-06 11:59:30');
    
    
