### Employees

EmployeeID | FirstName | LastName | ManagerID | Salary | JobPosition | Active
--- | --- | --- | --- | --- | --- | --- 
123 | John | Smith | 147 | 2000 | QA Engineer | 0
456 | Victoria | Mush | 147 | 3000 | Senior Engineer | 1
789 | Harry | Thomason | 258 | 1500 | QA Engineer | 1

### Managers

ManagerID | FirstName | LastName
--- | --- | ---
147 | Maria | Ferrero
258 | Jack | Henderson
369 | Bob | Park

1. Посчитать количество всех сотрудников, которые до сих пор работают в компании (флаг Active)
   ```
   SELECT * FROM employees WHERE active = 1;
   ```
2. Посчитать количество всех сотрудников на каждой должности
   ```
   SELECT jobposition, COUNT (EmployeeID) FROM employees GROUP BY jobposition;
   ```
3. Вывести тех сотрудников (FirstName, LastName), у которых заработная плата больше либо равна 2000$
   ```
   SELECT firstname, lastname FROM employees WHERE salary >= 2000;
   ```
4. Вывести только те должности (JobPosition) сотрудников, где средняя заработная плата превышает 2000$
   ```
   SELECT jobposition FROM(SELECT jobposition, AVG(salary) as avgs FROM employees GROUP BY jobposition) as r
   WHERE avgs > 2000;
   ```
5. Вывести FirstName, LastName только тех сотрудников, имя менеджера которых начинается на букву M
   ```
   SELECT e.firstname, e.lastname FROM employees as e, managers as m 
   WHERE e.managerid = m.managerid AND m.firstname LIKE 'M%';
   ```
6. Предположим, что это все записи, которые имеются в таблицах Employees и Managers
   Какой будет итоговый результат следующего запроса?
   ```
   select e.FirstName, e.LastName, e.ManagerID, m.ManagerID from Employees e
   right join Managers m
   on e.ManagerID = m.ManagerID
   ```
   firstname|lastname|managerid|managerid
   ---|---|---|---
   John     | Smith    | 147  | 147
   Victoria | Mush     | 147  | 147
   Harry    | Thomason | 258  | 258
   null     | null     | null | 369
   