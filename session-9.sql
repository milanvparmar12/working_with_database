-- 1.  Create two tables in your database: 'restaurants' (id, name, city) and 'dishes' (id, restaurant_id, dish_name, price). Insert at least 3 restaurants and 2-3 dishes for each restaurant.

use music_streaming_app;

create table restaurants1 (
    id int primary key,
    name varchar(100),
    city varchar(50)
);

insert into restaurants1 values
(1, 'Food Junction', 'Ahmedabad'),
(2, 'Spice Hub', 'Surat'),
(3, 'Royal Kitchen', 'Vadodara'),
(4, 'Cafe Delight', 'Rajkot');

create table dishes (
    id int primary key,
    restaurant_id int,
    dish_name varchar(100),
    price decimal(10,2)
);

insert into dishes values
(1, 1, 'Paneer Tikka', 220.00),
(2, 1, 'Biryani', 280.00),
(3, 1, 'Butter Naan', 60.00),
(4, 2, 'Masala Dosa', 150.00),
(5, 2, 'Pav Bhaji', 120.00),
(6, 2, 'Veg Biryani', 200.00),
(7, 3, 'Dal Makhani', 180.00),
(8, 3, 'Paneer Butter Masala', 240.00),
(9, 3, 'Tandoori Roti', 40.00),
(10, 99, 'Special Biryani', 300.00);

select * from restaurants1;
select * from dishes;

-- 2.  Write an SQL INNER JOIN query to display each dish along with its restaurant name and city, similar to how Zomato shows dish details with the restaurant info.

select r.name,r.city , d.dish_name,d.price from restaurants1 r
inner join dishes d
on r.id =  d.restaurant_id;

-- 3.  Write an SQL LEFT JOIN query to list all restaurants and their dishes, showing restaurants even if they currently have no dishes on the menu. 

select r.name,r.city , d.dish_name,d.price from restaurants1 r
left join dishes d
on r.id =  d.restaurant_id;

-- 4.  Write an SQL RIGHT JOIN query to display all dishes and their restaurant names, including any dishes that might not be linked to a restaurant (simulate a data error where a dish has a restaurant_id that doesn't match any restaurant).

select r.name,r.city , d.dish_name,d.price from restaurants1 r
right join dishes d
on r.id =  d.restaurant_id;

-- 5.  Given this scenario: You want to show a list of all playlists and the songs inside them, like Spotify. Explain which JOIN type (INNER, LEFT, or RIGHT) you would use to show all playlists, even if some are empty, and write the SQL query for it.

select p.name,s.song_name from playlists p
left join songs s
on p.playlists_id = s.playlist_id;