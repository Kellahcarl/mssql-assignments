-- The following query returns the number of customers in every country :
--  i used city as country 
SELECT
    city country,
    COUNT (customer_id) customer_count
FROM
    sales.customers
GROUP BY
    city
ORDER BY
    city;


-- using having clause

SELECT
    city country,
    COUNT (customer_id) customer_count
FROM
    sales.customers
GROUP BY
    city
HAVING
    COUNT (customer_id) > 3
ORDER BY
    city;