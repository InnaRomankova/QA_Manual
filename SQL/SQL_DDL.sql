-- SQL_DDL

-- Таблица employees

-- 1.	Создать таблицу employees
-- id. serial,  primary key,
-- employee_name. Varchar(50), not null

create table employees(
id serial primary key,
employee_name varchar(50) not null
);

-- 2.	Наполнить таблицу employee 70 строками.

insert into employees (
id, employee_name) 
values (
default, 'Гончарова Арина Елисеевна');

-- Таблица salary

-- 3.	Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null

create table salary(
id serial primary key,
monthly_salary int not null
);

-- 4.	Наполнить таблицу salary 15 строками:
-- 1000
-- 1100
-- 1200
-- 1300
-- 1400
-- 1500
-- 1600
-- 1700
-- 1800
-- 1900
-- 2000
-- 2100
-- 2200
-- 2300
-- 2400
-- 2500

insert into salary(
id, monthly_salary) 
values (
default, 1000);

-- Таблица employee_salary

-- 5.	Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_id. Int, not null

create table employee_salary(
id serial primary key,
employee_id int not null,
salary_id int not null,
foreign key (employee_id)
	references employees (id),
foreign key (salary_id)
	references salary (id)
);

-- 6.	Наполнить таблицу salary 40 строками:
-- в 10 строк из 40 вставить несуществующие employee_id
-- id	employee_id	salary_id
-- 1	 3	 7
-- 2	 1	 4
-- 3	 5	 9
-- 4	 40	 13
-- 5	 23	 4
-- 6	 11	 2
-- 7	 52	 10
-- 8	 15	 13
-- 9	 26	 4
-- 10 16	 1
-- 11 33	 7
-- ... ... ...

insert into employee_salary (
id, employee_id, salary_id)
values (
default, 3, 7
);

-- Таблица roles

-- 7.	Создать таблицу roles
-- id. Serial  primary key,
-- role_name. int, not null, unique

create table roles(
id serial primary key,
role_name int not null unique
);

-- 8.	Поменять тип столба role_name с int на varchar(30)

alter table roles
alter column role_name type varchar(30)
using role_name::varchar;

-- 9.	Наполнить таблицу salary 20 строками:

-- id	role_name
-- 1	    Junior Python developer
-- 2	    Middle Python developer
-- 3	    Senior Python developer
-- 4	    Junior Java developer
-- 5	    Middle Java developer
-- 6	    Senior Java developer
-- 7	    Junior JavaScript developer
-- 8     Middle JavaScript developer
-- 9	    Senior JavaScript developer
-- 10	Junior Manual QA engineer
-- 11	Middle Manual QA engineer
-- 12	Senior Manual QA engineer
-- 13	Project Manager
-- 14	Designer
-- 15	HR
-- 16	CEO
-- 17	Sales manager
-- 18	Junior Automation QA engineer
-- 19	Middle Automation QA engineer
-- 20	Senior Automation QA engineer

insert into roles(
id,role_name)
values(
default, 'Junior Python developer'
);

-- Таблица roles_employee

-- 10.	Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- role_id. Int, not null (внешний ключ для таблицы roles, поле id)

create table employee_salary_id(
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id)
	references employees(id),
foreign key (role_id)
	references roles(id)
);

-- 11.	Наполнить таблицу salary 40 строками:
-- id	employee_id	role_id
-- 1 	7	2
-- 2 	20	4
-- 3 	3	9
-- 4 	5	13
-- 5 	23	4
-- 6 	11	2
-- 7 	10	9
-- 8	    22	13
-- 9 	21	3
-- 10	34	4
-- 11	6	7
-- ...	...	...

insert into employee_salary_id(
id, employee_id, role_id)
values (default,67,	10 );


