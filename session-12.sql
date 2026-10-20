-- 1. Create a CTE using the WITH clause to select all products with a rating above 4.5 from a 'Products' table, similar to how Flipkart or Myntra might highlight top-rated items.

use music_streaming_app;

with rating_product as(
	select * from products3
	where rating > 4.5
)
select * from products3;

-- 2. Rewrite a query that finds all restaurants in 'Ahmedabad' with delivery charges under 50 from a 'Restaurants' table, first using a subquery and then using a CTE. Compare both queries for readability.

select * from (
	select * from restaurants2
	where city = "ahmedabad" and delivery_charge < 50
) as restaurants;


with restaurants as (
	select * from restaurants2
    where city = "ahmedabad" and delivery_charge < 50
)
select * from restaurants;  

-- 3. Using two CTEs in a single query, find the top 3 most-followed users and the top 3 most-liked posts from a 'Users' and 'Posts' table (think Instagram-style data). Output both lists in the same result set.

with Users as (
    select * ,
        row_number() over(order by followers_count desc, user_id) rn
		from Users1
),

Posts as (
    select * ,
	row_number() over(order by likes_count desc, post_id) as rn
    from Posts
)

select 'top users' as category ,
username name,
followers_count count from Users
where rn <= 3

union all

select 'top posts' as category,
post_content name,
likes_count count from Posts
where rn <= 3;

-- 4. Write a recursive CTE that generates a list of dates for the next 7 days starting from today, similar to how BookMyShow shows available dates for movie bookings.

with recursive nextsevendays as (
    select curdate() booking_date

    union all

    select date_add(booking_date, interval 1 day)
    from nextsevendays
    where booking_date < date_add(curdate(), interval 6 day)
)
select booking_date from nextsevendays
order by booking_date;

-- 5. Given a messy SQL query that finds all users with more than 1000 followers from a 'Users' table, refactor it to use a CTE for better clarity and maintainability.

with user as (
	select * from users1
    where followers_count > 1000 
)
select * from user;