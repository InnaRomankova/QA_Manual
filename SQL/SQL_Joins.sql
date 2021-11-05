-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select e.employee_name, s.monthly_salary
from employee_salary es 
join employees e on es.employee_id = e.id 
join salary s on es.salary_id = s.id ;

-- 2. Вывести всех работников у которых ЗП меньше 2000

select e.employee_name, s.monthly_salary 
from employee_salary es 
join employees e on es.employee_id = e.id 
join salary s on es.salary_id = s.id 
where monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select s.id, s.monthly_salary, es.employee_id 
from employee_salary es 
right outer join salary s on es.salary_id =s.id 
where es.employee_id is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select s.id, s.monthly_salary, es.employee_id 
from employee_salary es 
right outer join salary s on es.salary_id =s.id 
where es.employee_id is null and s.monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.

select e.employee_name, es.salary_id 
from employees e 
left outer join employee_salary es on e.id = es.employee_id 
where es.salary_id is null;

-- 6. Вывести всех работников с названиями их должности.

select e.employee_name, r.role_name 
from employee_salary_id esi 
join employees e on e.id =esi.employee_id 
join roles r on r.id = esi.role_id;

-- 7. Вывести имена и должность только Java разработчиков.

select e.employee_name, r.role_name 
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
where r.role_name like '%Java developer';

-- 8. Вывести имена и должность только Python разработчиков.

select e.employee_name, r.role_name 
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
where r.role_name like '%Python developer';

-- 9. Вывести имена и должность всех QA инженеров.

select e.employee_name, r.role_name 
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id
where r.role_name like '%QA engineer';

-- 10. Вывести имена и должность ручных QA инженеров.

select e.employee_name, r.role_name 
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
where r.role_name like '%Manual QA engineer';

-- 11. Вывести имена и должность автоматизаторов QA

select e.employee_name, r.role_name 
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.id 
where r.role_name like '%Automation QA engineer';

-- 12. Вывести имена и зарплаты Junior специалистов

select e.employee_name, r.role_name, s.monthly_salary 
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id
where r.role_name like '%Junior%';

-- 13. Вывести имена и зарплаты Middle специалистов

select e.employee_name, r.role_name, s.monthly_salary 
from employee_salary_id esi 
join roles r on r.id = esi.role_id 
join employees e on e.id = esi.employee_id
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
where r.role_name like 'Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов

select e.employee_name, r.role_name, s.monthly_salary 
from employee_salary_id esi 
join roles r on r.id = esi.role_id 
join employees e on e.id = esi.employee_id 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
where r.role_name like '%Senior%';

-- 15. Вывести зарплаты Java разработчиков

select e.employee_name, r.role_name, s.monthly_salary 
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
where r.role_name like '%Java developer';

-- 16. Вывести зарплаты Python разработчиков

select e.employee_name, r.role_name, s.monthly_salary 
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
where r.role_name like '%Python developer';

-- 17. Вывести имена и зарплаты Junior Python разработчиков

select e.employee_name, r.role_name, s.monthly_salary 
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
where r.role_name like 'Junior Python developer';

-- 18. Вывести имена и зарплаты Middle JS разработчиков

select e.employee_name, r.role_name, s.monthly_salary 
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
where r.role_name like 'Middle JavaScript developer';

-- 19. Вывести имена и зарплаты Senior Java разработчиков

select e.employee_name, r.role_name, s.monthly_salary 
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
where r.role_name like 'Senior Java developer';

-- 20. Вывести зарплаты Junior QA инженеров

select e.employee_name, r.role_name, s.monthly_salary 
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
where r.role_name like 'Junior%QA engineer';

-- 21. Вывести среднюю зарплату всех Junior специалистов

select avg(s.monthly_salary) as average_salary 
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
where r.role_name like 'Junior%';

-- 22. Вывести сумму зарплат JS разработчиков

select sum(s.monthly_salary) as sum_salary
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
where r.role_name like '%JavaScript developer';

-- 23. Вывести минимальную ЗП QA инженеров

select min(s.monthly_salary) as min_salary
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
where r.role_name like '%QA engineer';

-- 24. Вывести максимальную ЗП QA инженеров

select max(s.monthly_salary) as max_salary
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
where r.role_name like '%QA engineer';

-- 25. Вывести количество QA инженеров

select count(*) as count_QA_engineers
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
where r.role_name like '%QA engineer';

-- 26. Вывести количество Middle специалистов.

select count(*) as count_Middle
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
where r.role_name like 'Middle%';

-- 27. Вывести количество разработчиков

select count(*) as count_developers 
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
where r.role_name like '%developer';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(s.monthly_salary) as sum_developers_salary
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
join employee_salary es on e.id = es.employee_id 
join salary s on s.id = es.salary_id 
where r.role_name like '%developer';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select e.employee_name, r.role_name, s.monthly_salary 
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
order by e.employee_name;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select e.employee_name, r.role_name, s.monthly_salary 
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
where s.monthly_salary > 1700 and s.monthly_salary < 2300
order by s.monthly_salary, e.employee_name;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select e.employee_name, r.role_name, s.monthly_salary 
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
where s.monthly_salary < 2300
order by s.monthly_salary, e.employee_name;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select e.employee_name, r.role_name, s.monthly_salary 
from employee_salary_id esi 
join employees e on e.id = esi.employee_id 
join roles r on r.id = esi.role_id 
join employee_salary es on es.employee_id = e.id 
join salary s on s.id = es.salary_id 
where s.monthly_salary in (1100,1500,2000)
order by s.monthly_salary, e.employee_name;


