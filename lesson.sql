use lesson;

select * from people;

drop table if exists people;

create table people (
id integer primary key auto_increment,
firstname varchar(128),
lastname varchar(128)
);

insert into people (firstname, lastname) values ('Anton', 'Golubev'),
												('Viktoria', 'Petrova'),
                                                ('Olga', 'Ivanova');
                                                insert into people (firstname, lastname) values ('Aigars', 'Alutis');
 delete from people
 where firstname = 'Aigars';
 
 
 select * from Students;
 
 truncate people;
 
 delete from people;
	
    alter table Students
    modify column avg_mark numeric(2.1) check (avg_mark  between  0 and 5);
                                   
                                   drop table Students;
			create table Students(
            id integer primary key auto_increment,
            name varchar(128),
            lastname varchar(128),
            avg_mark  numeric(2, 1) check (avg_mark  between  0 and 5),
            gender   char(1) check (gender IN ('m','f'))
            );
            
            insert into Students (name,lastname, avg_mark,gender) values ('Олег',' Петров', 4.3, 'M'),
																	('Семен',' Степанов', 3.1, 'M'),
                                                                    ('Ольга',' Семенова', 4.7, 'F'),
                                                                    ('Игорь',' Романов', 3.1, 'M'),
                                                                    ('Ирина',' Иванова', 2.2, 'f');
                                                                    
                                                                    
                                                                select * from Students;   
                                                                
ALTER TABLE	Students
					modify	COLUMN	 avg_mark numeric (3, 1);			
                    
                    update Students
                    SET avg_mark = avg_mark * 10;
                    
                    alter table Students
                    drop check students_chk_1;
                    
                    
                    update students
                    set avg_mark = avg_mark +10
                    where avg_mark <= 31;
                    
                    set sql_safe_updates = 0;
                                                                
																	
Alter table Students
add id integer primary key auto_increment;

 alter table Students
    rename  column name to firstname ;
    
    select * from Students
    where avg_mark > 4;
    
    select * from Students
    where avg_mark  not between 3 and 4;
    
      select * from Students
      where name like 'И%';
      

     select * from Students
     where avg_mark in (2.2,3.1,4.7);
    
    select distinct 
    avg_mark
     from
     Students;
    
  
    
    
    update Students
    set lastname = 'Сидоров'
    where id = 1;


