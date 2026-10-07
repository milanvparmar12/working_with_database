-- 1. Create a table called Orders with columns: order_id, user_id, payment_method, and amount. Insert at least 8 sample records representing different users and payment methods (like UPI, Card, Wallet, COD).

use music_streaming_app;

create table orders1(
	order_id int primary key,
    user_id int(50),
    payment_method varchar(50),
	total_amount decimal(10,2)
);

insert into orders1 values
(1, '101', 'UPI', 450),
(2, '102', 'Card', 250),
(3, '101', 'Wallet', 350),
(4, '103', 'COD', 600),
(5, '104', 'UPI', 200),
(6, '102', 'Card', 500),
(7, '103', 'UPI', 700),
(8, '104', 'Wallet', 300);

select * from orders1;

-- 2. Write an SQL query to count how many orders were placed using each payment_method in the Orders table, similar to how Zomato shows payment breakdown in analytics.

select payment_method , count(*) order_count
from orders1
group by payment_method; 

-- 3. Write an SQL query to find the total amount spent by each user_id in the Orders table. Display user_id and their total spend.

select user_id , sum(total_amount) total_amount
from orders1 
group by user_id;

-- 4. Write an SQL query to show only those payment methods where the average order amount is greater than 300, using GROUP BY and HAVING.

select payment_method , avg(total_amount) avg_amount 
from orders1 
group by payment_method
having avg(total_amount) > 300 ;

-- 5. Explain the difference between WHERE and HAVING by giving one example query for each, using the Orders table. Your examples should show a scenario where WHERE and HAVING filter different things.

-- where is filters the table row by row.
-- where works befor grouping. 
 
select *
from Orders
where amount > 300;

-- having filtering the group.
-- having works after grouping  
 
select payment_method, avg(amount) average_amount
from Orders
group by payment_method
having avg(amount) > 300;