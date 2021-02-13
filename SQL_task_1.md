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
   ```SQL
   SELECT * FROM employees WHERE active = 1;
   ```
2. Посчитать количество всех сотрудников на каждой должности
   ```SQL
   SELECT * FROM employees WHERE active = 1;
   ```
3. Вывести тех сотрудников (FirstName, LastName), у которых заработная плата больше либо равна 2000$
4. Вывести только те должности (JobPosition) сотрудников, где средняя заработная плата превышает 2000$
5. Вывести FirstName, LastName только тех сотрудников,имя менеджера которых начинается на букву M
6. Предположим, что это все записи, которые имеются в таблицах Employees и Managers
Какой будет итоговый результат следующего запроса? select e.FirstName, e.LastName, e.ManagerID, m.ManagerID from Employees e right join Managers m on e.ManagerID = m.ManagerID