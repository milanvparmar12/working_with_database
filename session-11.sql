-- 1. Create a SQL query using a subquery in the WHERE clause to find all restaurants from a 'Restaurants' table whose average rating is higher than the average rating of all restaurants in the city.

use music_streaming_app;

select * from restaurants 
where rating > (select avg(rating) from restaurants) ;

-- 2. Write a SQL query that uses a subquery in the SELECT statement to display each user's name from a 'Users' table along with the total number of orders they have placed from an 'Orders' table, like a summary you might see in a Zomato user profile.

select u.username, 
(select count(*) from Orders2 o 
where o.user_id = u.id) total_orders
from Users u;

-- 3. Given a 'Movies' table and a 'Reviews' table, write a SQL query using IN with a subquery to list all movies that have at least one review with a rating of 5 stars, as seen in BookMyShow's top-rated section.

select movie_id, title from Movies
where movie_id in (select movie_id from Reviews
where rating = 5);

-- 4. Write a nested SQL query to find the names of all sellers from a 'Sellers' table on a Flipkart-style platform who have sold products in every category listed in a 'Categories' table.

select s.seller_name from Sellers s
where not exists (
select c.category_id from Categories1 c
where not exists (
select 1 from Products2 p
where p.seller_id = s.seller_id and p.category_id = c.category_id));

