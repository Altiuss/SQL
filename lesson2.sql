create database homework;
show databases;
use homework;

create table animals (
id integer primary key,
title varchar(128),
country varchar(128)
);

insert into  animals (id, title, country) values (1, 'cat', 'Germany'),
													(2, 'Dog', 'Spain'),
                                                    (3, 'Snake', 'France'),
                                                    (4, 'Mouse', 'Bulgaria');
                                                    
	select * from animals;			
    
    
    alter table animals
    add age integer default 0;
    
    update animals
    set age = null;
    
    
    set sql_safe_updates = 0;
    
    alter table animals 
    modify age numeric(3,1);
    
    alter table animals
    modify age integer;
    
    alter table animals
    rename  column age to animal_age ;
    
    alter table animals
    drop column animal_age;