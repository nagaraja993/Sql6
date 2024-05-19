# Write your MySQL query statement below
WITH CTE AS (
    SELECT customer_id, date_format(order_date, "%Y") AS year, SUM(price) AS 'amount'
    FROM Orders GROUP BY customer_id, year
    ORDER BY customer_id, year)

SELECT c1.customer_id FROM CTE c1 LEFT JOIN CTE c2
ON c1.customer_id = c2.customer_id AND
c1.year = c2.year - 1 AND c2.amount > c1.amount
GROUP BY c1.customer_id
HAVING count(*) - count(c2.customer_id) = 1;