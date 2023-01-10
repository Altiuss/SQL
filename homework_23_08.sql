-- Используя sql workbench, создайте на компьютере базу данных homework.

create database homework;
show databases;

-- Внутри БД homework создайте таблицу animals (id, title, country)
use homework;

create table animals (
	id integer primary key,
    title varchar(128),
    country varchar(128)
);

-- Добавьте несколько строк в таблицу

insert into animals (id, title, country) values (1, 'Cat', 'Germany'),
												(2, 'Dog', 'Spain'),
                                                (3, 'Snake', 'France'),
                                                (4, 'Mouse', 'Bulgaria');
                                                

-- Проверьте содержимое таблицы
select * from animals;

-- Добавьте поле age (integer) со значением по умолчанию 0

ALTER TABLE animals
ADD age integer default 0;

-- Измените тип поля age на numeric(3, 1). Перед изменением типа необходимо очистить поле

UPDATE animals
SET age = null;

set sql_safe_updates = 0;

ALTER TABLE animals
MODIFY age numeric(3, 1);

-- Измените тип поля age обратно на integer

ALTER TABLE animals
MODIFY age integer;

-- Переименуйте поле age на animal_age

ALTER TABLE animals
RENAME COLUMN age to animal_age;

ALTER TABLE animals
CHANGE animal_age age integer;

-- Удалите поле age

ALTER TABLE animals
DROP COLUMN age;
