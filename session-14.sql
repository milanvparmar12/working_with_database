-- 1. Create a table called Orders with columns: order_id, user_id, order_date, and total_amount. Insert at least 7 sample rows representing different users and dates, similar to how food orders appear in Zomato or Swiggy.

use music_streaming_app;

create table orders3(
	order_id int primary key, 
    user_id int, 
    order_date date, 
    total_amount decimal(10,2)
);

insert into Orders3 values
(1, 101, '2026-10-01', 250.00),
(2, 101, '2026-10-03', 400.00),
(3, 101, '2026-10-05', 150.00),
(4, 102, '2026-10-02', 300.00),
(5, 102, '2026-10-04', 500.00),
(6, 103, '2026-10-01', 200.00),
(7, 103, '2026-10-06', 350.00);

select * from orders3;

-- 2. Write a SQL query using the LAG() function to show each user's order_id, order_date, and the total_amount of their previous order (if any), ordered by user and date.

select *,
lag(total_amount) over(partition by user_id order by order_date) previous_order 
from orders3;

-- 3. Using the same Orders table, write a SQL query with the LEAD() function to display each order_id, order_date, and the next order's total_amount for the same user.

select *,
lead(total_amount) over(partition by user_id order by order_date) next_order 
from orders3;

-- 4. Write a SQL query to calculate the running total of total_amount for each user, showing order_id, order_date, total_amount, and a column running_total that accumulates the sum as you move through each user's orders.

select * , sum(total_amount) 
over(order by total_amount) running_total 
from orders3;

-- 5. Write a SQL query to calculate a 3-order moving average of total_amount for each user, showing order_id, order_date, total_amount, and moving_avg columns. 

select * , avg(total_amount)
over(partition by user_id order by order_date) moving_avg
from orders3;