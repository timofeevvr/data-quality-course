Используем общедоступный ресурс:<br>
Решить задачу, выполнить запрос и предоставить текст запроса и  скриншот с запросом и результатом выполнения.<br>
https://www.w3schools.com/sql/trysql.asp?filename=trysql_op_in
1. Составьте запрос, который выведет Кастомеров, для которых нет заказов.<br>
   ```
   SELECT * FROM customers WHERE customerid NOT IN (SELECT customerid FROM orders);
   ```
   
2. Посчитать количество продуктов в каждом заказе и вывести максимальное число продуктов среди всех заказов.<br>
   ```
   SELECT MAX(q) FROM (SELECT OrderID, SUM(Quantity) as q FROM OrderDetails GROUP BY OrderID);
   ```

3. Выбрать самого молодого сотрудника, родившегося в 50-х годах.<br>
   ```
   SELECT * FROM Employees WHERE BirthDate = (SELECT MIN(BirthDate) FROM Employees 
   WHERE BirthDate BETWEEN '1950-01-01' AND '1959-12-31');
   ```

4. Посчитать количество кастомеров, которые заказывали продукты, поставляемые из Великобритании и Испании
   ```
   SELECT COUNT(CustomerID) FROM (
   SELECT DISTINCT c.CustomerID FROM Customers as c 
   JOIN Orders as o ON c.CustomerID = o.CustomerID 
   JOIN OrderDetails as od ON o.OrderID = od.OrderID
   JOIN Products as p ON od.ProductID = p.ProductID
   JOIN Suppliers as s ON p.SupplierID = s.SupplierID
   WHERE s.Country IN ('UK', 'Spain') 
   ORDER BY c.CustomerID);
   ```

5. Вывести сотрудников таким образом, чтобы сотрудник Dodsworth	Anne присутствовал дважды.
   Для полученного результата написать запрос, который подсветит наличие дубликатов - 
   выведет дублирующиеся строки - Анну в нашем случае.
   ```
   SELECT * FROM (
      SELECT * FROM Employees 
      UNION ALL
      SELECT * FROM Employees WHERE LastName = 'Dodsworth' AND FirstName = 'Anne')
   GROUP BY FirstName, LastName
   HAVING COUNT(*) > 1;
   ```

6. Написать запрос, который сравнит количество символов в колонке Country
   из Таблицы поставщиков (Suppliers) и кастомеров (Customers)
   Дополнение к 6-ой задаче
   Написать запрос, который сравнит количество символов в колонке Country из Таблицы поставщиков и кастомеров.
   Добавьте еще одну колонку Result. Если количество символов в колонках совпадает,
   то тогда значение в колонке Result 'Y', если не совпадает, то 'N'
   ```
   SELECT SUM(LENGTH(s.Country)), SUM(LENGTH(c.Country)), 
   CASE WHEN (SUM(LENGTH(s.Country)) - SUM(LENGTH(c.Country))) = 0 THEN 'Y' ELSE 'N' END
   FROM Suppliers as s, Customers as c;
   ```

7. В таблице Suppliers сгруппируйте поставщиков (SupplierName) по первой букве и выведите, 
   какое количество поставщиков приходится на каждую букву. Полученные строки отсортируйте в алфавитном порядке. 
   Результат работы запроса должен иметь приблизительно такой вид:
   A - 2 
   C - 3 
   D - 1
   ```
   SELECT SUBSTR(SupplierName, 1, 1) as sn, COUNT(SupplierName) FROM Suppliers GROUP BY sn ORDER BY sn
   ```

8. Вывести кастомеров (customerid, customername), у которых самый высокий по стоимости товар в заказе 
   давайте чуть изменим задание, точнее дополним. 
   найдите кастомеров, у которых либо самый высокий товар по стоимости, либо второй по стоимости
   ```
   SELECT DISTINCT c.CustomerID, c.CustomerName FROM Customers as c 
   JOIN Orders as o ON c.CustomerID = o.CustomerID 
   JOIN OrderDetails as od ON o.OrderID = od.OrderID
   JOIN Products as p ON od.ProductID = p.ProductID
   GROUP BY c.CustomerID ORDER BY SUM(p.Price) DESC
   LIMIT 1 OFFSET 1;
   ```
