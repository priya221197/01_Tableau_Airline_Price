use cust;
#1.Write a SQL query to retrieve the first 5 rows from the "customers" table .
select * from customers 
limit 5; 
#2. Write a SQL query to retrieve the unique city names from "customers" table sorted in 
#descending order.
select distinct city from customers order by city desc;
#3. Write a SQL query to get the number of unique city names "offices" table.
select count(distinct city) from offices; 
#4. Write a SQL query to get the maximum, minimum and average value from the 
# "CreditLimit" column in the "customers" table.
select max(Creditlimit),min(Creditlimit),avg(Creditlimit) from customers;
#5. Write a SQL query to get the city names which are present in “offices” table but not in 
#“customer” table.
select city from offices where city not in (select city from customers) ;
#6. Write a SQL query to get the city names which are present in “offices” table as well as in 
# “customer” table
select city from offices where city in (select city from customers) ;
#7. Write a SQL query to get records where city or state is not given in “customer” table and 
# creditlimit is in the range – 80000 to 130000.
select * from customers WHERE (city IS NULL OR state IS NULL) and creditlimit between 80000 and 130000;
#8. Write a SQL query to get the maximum number of orders placed on a particular date and 
# what is that date in orders table.
SELECT orderDate, COUNT(*) as num_orders
FROM orders
GROUP BY orderDate
ORDER BY num_orders DESC
limit 1;
#9. For the records which we get in previous question(Q8), write a SQL query to get the 
#customer names and their phone numbers.
SELECT c.customerName, c.phone
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
WHERE o.orderDate = 
(  SELECT orderDate
  FROM orders
  GROUP BY orderDate
  ORDER BY COUNT(*) DESC
  LIMIT 1);
#10. SQL query to get the customer phone number and customer name from customers table 
# where order is either cancelled or disputed in orders table.
SELECT c.customerName, c.phone
FROM customers c
INNER JOIN orders o ON c.customerNumber = o.customerNumber
WHERE o.status IN ('cancelled', 'disputed');
#11. Write a SQL query to get the top 4 highest selling products from orderdetails table
SELECT productCode, sum(quantityOrdered) AS total_sold
FROM order_deteils
GROUP BY productCode
ORDER BY total_sold DESC
LIMIT 4;
#12. Write a SQL query to get the count of orders placed by each customer in 2003 and 2004
SELECT orders.customernumber, COUNT(orders.Ordernumber) AS NumOrders
FROM orders
WHERE YEAR(orders.OrderDate) IN (2003, 2004)
GROUP BY orders.customernumber
order by NumOrders desc;
#13. Write a SQL query to get the city names from customer table where more than 4 
# customers reside.
Select customers.city, count(DISTINCT customers.customername) as numcustomers
from customers
group by customers.city
having numcustomers > 4
order by numcustomers desc;