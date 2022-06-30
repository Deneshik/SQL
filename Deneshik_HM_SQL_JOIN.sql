--*SQL HomeWork 2. Joins

select * from employees;
select * from salary3;
select * from employee_salary;
select * from roles3;
select * from roles_employee order by role_id;

--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select e.employee_name, s.monthly_salary from employees e
join employee_salary es on e.id = es.employee_id
join salary s on s.id = es.salary_id;

--2. Вывести всех работников у которых ЗП меньше 2000.

select e.employee_name, s.monthly_salary from employees e
join employee_salary es on e.id = es.employee_id
join salary s on s.id = es.salary_id
where s.monthly_salary < 2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select s.monthly_salary from salary s 
left join employee_salary es on s.id = es.salary_id
where es.employee_id is null;

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select s.monthly_salary from salary s 
left join employee_salary es on s.id = es.salary_id
where es.employee_id is null and monthly_salary < 2000;

--5. Найти всех работников кому не начислена ЗП.

select e.employee_name, s.monthly_salary from employees e
left join employee_salary es on employee_id = e.id
left join salary s on salary_id = s.id
where salary_id is null;

--6. Вывести всех работников с названиями их должности.

select e.employee_name, r.role_name from employees e
join roles_employee re on re.employee_id  = e.id
join roles3 r on r.id = re.role_id;

--7. Вывести имена и должность только Java разработчиков.

select e.employee_name, r.role_name from employees e
join roles_employee re on re.employee_id  = e.id
join roles3 r on r.id = re.role_id
where r.role_name like '%Java developer%';

--8. Вывести имена и должность только Python разработчиков.

select e.employee_name, r.role_name from employees e
join roles_employee re on re.employee_id  = e.id
join roles3 r on r.id = re.role_id
where r.role_name like '%Python developer%';

--9. Вывести имена и должность всех QA инженеров.

select e.employee_name, r.role_name from employees e
join roles_employee re on re.employee_id  = e.id
join roles3 r on r.id = re.role_id
where r.role_name like '%QA%';

--10. Вывести имена и должность ручных QA инженеров.

select e.employee_name, r.role_name from employees e
join roles_employee re on re.employee_id  = e.id
join roles3 r on r.id = re.role_id
where r.role_name like '%Manual%';

--11. Вывести имена и должность автоматизаторов QA

select e.employee_name, r.role_name from employees e
join roles_employee re on re.employee_id  = e.id
join roles3 r on r.id = re.role_id
where r.role_name like '%Automation%';

--12. Вывести имена и зарплаты Junior специалистов

select e.employee_name,r.role_name, s.monthly_salary from employees e
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
join roles_employee re on re.employee_id = es.employee_id 
join roles3 r on r.id = re.role_id 
where r.role_name like '%Junior%';

--13. Вывести имена и зарплаты Middle специалистов

select e.employee_name,r.role_name, s.monthly_salary from employees e
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
join roles_employee re on re.employee_id = es.employee_id 
join roles3 r on r.id = re.role_id 
where r.role_name like '%Middle%';

--14. Вывести имена и зарплаты Senior специалистов

select e.employee_name,r.role_name, s.monthly_salary from employees e
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
join roles_employee re on re.employee_id = es.employee_id 
join roles3 r on r.id = re.role_id 
where r.role_name like '%Senior%';

--15. Вывести зарплаты Java разработчиков

select r.role_name, s.monthly_salary from salary s
join employee_salary es on es.employee_id = s.id
join roles_employee re on re.employee_id = es.employee_id 
join roles3 r on r.id = re.role_id 
where r.role_name like '%Java developer%';

--16. Вывести зарплаты Python разработчиков

select r.role_name, s.monthly_salary from salary s
join employee_salary es on es.employee_id = s.id
join roles_employee re on re.employee_id = es.employee_id 
join roles3 r on r.id = re.role_id 
where r.role_name like '%Python developer%';

--17. Вывести имена и зарплаты Junior Python разработчиков

select e.employee_name, r.role_name, s.monthly_salary from employees e
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
join roles_employee re on re.employee_id = es.employee_id 
join roles3 r on r.id = re.role_id 
where r.role_name like '%Junior Python%';

--18. Вывести имена и зарплаты Middle JS разработчиков

select e.employee_name, r.role_name, s.monthly_salary from employees e
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
join roles_employee re on re.employee_id = es.employee_id 
join roles3 r on r.id = re.role_id 
where r.role_name like '%Middle JavaScript%';

--19. Вывести имена и зарплаты Senior Java разработчиков

select e.employee_name, r.role_name, s.monthly_salary from employees e
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
join roles_employee re on re.employee_id = es.employee_id 
join roles3 r on r.id = re.role_id 
where r.role_name like '%Senior Java%';

--20. Вывести зарплаты Junior QA инженеров

select s.monthly_salary from salary s
join employee_salary es on es.employee_id = s.id
join roles_employee re on re.employee_id = es.employee_id 
join roles3 r on r.id = re.role_id 
where r.role_name like '%Junior QA%';

--21. Вывести среднюю зарплату всех Junior специалистов

select avg(s.monthly_salary) from salary s
join employee_salary es on es.salary_id  = s.id
join roles_employee re on re.employee_id = es.employee_id 
join roles3 r on r.id = re.role_id 
where r.role_name like '%Junior%';

--22. Вывести сумму зарплат JS разработчиков

select sum(s.monthly_salary) from salary s
join employee_salary es on es.salary_id  = s.id
join roles_employee re on re.employee_id = es.employee_id 
join roles3 r on r.id = re.role_id 
where r.role_name like '%JavaScript developer%';

--23. Вывести минимальную ЗП QA инженеров

select min(s.monthly_salary) from salary s
join employee_salary es on es.salary_id  = s.id
join roles_employee re on re.employee_id = es.employee_id 
join roles3 r on r.id = re.role_id 
where r.role_name like '%QA%';

--24. Вывести максимальную ЗП QA инженеров

select max(s.monthly_salary) from salary s
join employee_salary es on es.salary_id  = s.id
join roles_employee re on re.employee_id = es.employee_id 
join roles3 r on r.id = re.role_id 
where r.role_name like '%QA%';

--25. Вывести количество QA инженеров

select count(role_name) from roles3 r
join roles_employee re on r.id = re.role_id 
where r.role_name like '%QA%';

--26. Вывести количество Middle специалистов.

select count(role_name) from roles3 r
join roles_employee re on r.id = re.role_id 
where r.role_name like '%Middle%';

--27. Вывести количество разработчиков

select count(role_name) from roles3 r
join roles_employee re on r.id = re.role_id 
where r.role_name like '%developer%';

--28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(s.monthly_salary) from salary s
join employee_salary es on es.salary_id  = s.id
join roles_employee re on re.employee_id = es.employee_id 
join roles3 r on r.id = re.role_id 
where r.role_name like '%developer%';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select e.employee_name, r.role_name, s.monthly_salary from employees e
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
join roles_employee re on re.employee_id = es.employee_id 
join roles3 r on r.id = re.role_id 
order by s.monthly_salary;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select e.employee_name, r.role_name, s.monthly_salary from employees e
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
join roles_employee re on re.employee_id = es.employee_id 
join roles3 r on r.id = re.role_id
where s.monthly_salary between 1700 and 2300
order by s.monthly_salary;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select e.employee_name, r.role_name, s.monthly_salary from employees e
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
join roles_employee re on re.employee_id = es.employee_id 
join roles3 r on r.id = re.role_id
where s.monthly_salary < 2300
order by s.monthly_salary;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select e.employee_name, r.role_name, s.monthly_salary from employees e
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
join roles_employee re on re.employee_id = es.employee_id 
join roles3 r on r.id = re.role_id
where s.monthly_salary in (1100, 1500, 2000)
order by s.monthly_salary;