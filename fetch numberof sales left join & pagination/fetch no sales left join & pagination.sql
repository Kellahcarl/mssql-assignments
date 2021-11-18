DROP table staff.sales
-- create table
CREATE TABLE staff.sales(
    sales_id int PRIMARY KEY IDENTITY(1,1), 
    employee_id int FOREIGN KEY REFERENCES staff.employees (employee_id),
    sales_count BIT null
)

-- populate table
insert into staff.sales(employee_id)
select top 10 employee_id
from staff.employees 

UPDATE staff.sales
    SET sales_count = (case when sales_id = 1 then '0'
                         when sales_id = 2 then '0'
                         when sales_id = 3 then '0'
                         when sales_id = 4 then '0'
                         when sales_id = 5 then '0'
                         when sales_id = 6 then '0'
                         when sales_id = 7 then '0'
                         when sales_id = 8 then '1'
                         when sales_id = 9 then '1'
                         when sales_id = 10 then '1'
                    end)
    WHERE sales_id in (1, 2, 3,4,5,6,7,8,9,10);


SELECT * FROM staff.sales

-- query showing all with no sales

SELECT first_name, last_name, s.sales_count
from staff.employees e
LEFT join staff.sales s on s.employee_id = e.employee_id 
    where s.sales_count = 0
    order by first_name

-- query showing all with no sales with pagination
DECLARE @PageNumber AS INT
DECLARE @RowsOfPage AS INT
SET @PageNumber=2
SET @RowsOfPage=4
SELECT first_name, last_name, s.sales_count, s.employee_id
from staff.employees e
LEFT join staff.sales s on s.employee_id = e.employee_id 
    where s.sales_count = 0
    order by e.employee_id 
    OFFSET (@PageNumber-1)*@RowsOfPage ROWS
    FETCH NEXT @RowsOfPage ROWS ONLY