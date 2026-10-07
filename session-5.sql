-- 1.Create a table called Orders with columns: order_id, user_name, total_amount, and order_date. Insert 5 sample rows with different users and order amounts, including at least one NULL value for total_amount.

use music_streaming_app;

CREATE TABLE Orders (
    order_id int primary key,
    user_name varchar(100),
    total_amount decimal(10,2),
    order_date date
);

insert into Orders values
(1, 'Amit', 1500.00, '2026-09-01'),
(2, 'Rahul', 850.50, '2026-09-02'),
(3, 'Amit', 2200.00, '2026-09-03'),
(4, 'Priya', null, '2026-09-04'),
(5, 'Rahul', 1200.75, '2026-09-05');

select * from Orders;

-- 2. Write a SQL query to count how many orders were placed by each user in the Orders table, displaying user_name and the number of orders as order_count.

select user_name , count(*) orders_count
from Orders
group by user_name;

-- 3. Write a SQL query to calculate the average total_amount of all orders in the Orders table, making sure to ignore any NULL values. 

select avg(total_amount) avg_amount
from Orders; 

-- 4. Suppose you are building a Flipkart-style dashboard: Write a SQL query to find the highest and lowest order amounts (MAX and MIN) from the Orders table, and display both values in a single result row. 

select max(total_amount) highest_order,
min(total_amount) lowest_order
from Orders;

-- 5. Write a SQL query to calculate the total sales (SUM of total_amount) for all orders, but only include orders where total_amount is not NULL.

select sum(total_amount) total_sales
from Orders
where total_amount is not null ;