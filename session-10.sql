-- 1.  Create two tables: Influencers (id, name) and Collaborations (id, influencer1_id, influencer2_id, collab_date). Write a SQL FULL JOIN query to list all influencers and show their collaboration partner names if any, including influencers with no collaborations.

use music_streaming_app;

create table influencers(
	id int primary key,
	name varchar(100)
);

insert into Influencers values
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Amit'),
(4, 'Neha');

create table collaborations(
	id int primary key,
    influencer1_id int, 
    influencer2_id int, 
    collab_date date
);

insert into Collaborations values
(1, 1, 2, '2026-01-10'),
(2, 2, 3, '2026-02-15'),
(3, 5, 1, '2026-03-20');

select * from influencers;
select * from collaborations;

select i.name, c.id, c.collab_date from Influencers i
left join Collaborations c
on i.id = c.influencer1_id
union
select i.name,c.id,c.collab_date from Influencers i
right join Collaborations c
on i.id = c.influencer1_id;

-- 2.  Using a SELF JOIN, write a query on a table called Playlists (id, user_id, playlist_name, parent_playlist_id) to display each playlist alongside its parent playlist name, similar to how Spotify shows nested playlists.

select p.playlist_name,parent.playlist_name from Playlists1 p
left join Playlists1 parent
on p.parent_playlist_id = parent.id; 

-- 3.  Given three tables: Users (id, username), Orders (id, user_id, order_date), and Payments (id, order_id, amount), write a SQL query using multiple JOINs to display each username, their order date, and payment amount, showing all users even if they have no orders or payments.

select u.username, o.order_date, p.amount from Users u
left join Orders2 o
on u.id = o.user_id
left join Payments p
on o.id = p.order_id;

-- 4.  You notice that your JOIN query between Zomato's Restaurants and Reviews tables is returning duplicate rows for some restaurants. Modify your query to eliminate duplicates and explain in one line why the duplicates were happening.

select r.name from Restaurants r
inner join Reviews rv
on r.id = rv.restaurant_id;

-- 5.  Write two different JOIN queries on a Products and Categories table (like Flipkart) to list all products with their category names, but use different join conditions in each. Briefly explain which join condition is more efficient and why.

SELECT p.product_name, c.category_name from Products1 p
join Categories c
on p.category_id = c.id;
