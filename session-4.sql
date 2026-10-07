-- 1. Create a table named MusicPlaylist with columns: id, song_name, artist, genre, and duration. Insert at least 5 records representing songs from your favorite Spotify playlist, then write a SELECT statement to retrieve all columns for all songs. 

use music_streaming_app;

create table MusicPlaylist (
    id int primary key,
    song_name varchar(20),
    artist varchar(20),
    genre varchar(20),
    duration time
);

insert into MusicPlaylist values
(1,'Blinding Lights','The Weeknd','Pop','00:03:20'),
(2, 'Levitating', 'Dua Lipa', 'Pop', '00:03:23'),
(3, 'Peaches', 'Justin Bieber', 'R&B', '00:03:18'),
(4, 'Save Your Tears','The Weeknd','Pop','00:03:35'),
(5, 'Kiss Me More', 'Doja Cat', 'R&B', '00:03:28');

select * from MusicPlaylist;

-- 2. Write a SQL query to display only the song_name and artist columns from the MusicPlaylist table, showing just the first 3 records using the LIMIT keyword. 

select song_name, artist
from MusicPlaylist
limit 3;

-- 3. Suppose you have a table named FoodOrders with columns: id, restaurant, food_item, and order_date. Write a SQL query to list all unique restaurant names where you have placed orders, using the DISTINCT keyword.

create table FoodOrders (
    id int primary key,
    restaurant varchar(50),
    food_item varchar(50),
    order_date date
);

insert into FoodOrders values
(1, 'Dominos', 'Pizza', '2026-09-01'),
(2, 'Zomato Kitchen', 'Biryani', '2026-09-02'),
(3, 'Dominos', 'Burger Pizza', '2026-09-03'),
(4, 'McDonalds', 'Burger', '2026-09-04'),
(5, 'Zomato Kitchen', 'Fried Rice', '2026-09-05');

select distinct restaurant
from FoodOrders;

-- 4. Write a SQL query on the FoodOrders table to select food_item as 'Dish' and order_date as 'Date Ordered', displaying only these two columns with the column aliases in the output.

select food_item as dish , 
order_date as date_ordered
from FoodOrders;

-- 5. You tried running this query: SELECT DISTINCT food_item, restaurant FROM FoodOrders LIMIT 2, but it returns an error or doesn't work as expected. Identify and fix the mistake in the query.

select distinct food_item , restaurant
from FoodOrders
limit 2;