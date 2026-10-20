-- 1. Create a table named Playlists with columns: id, user_id, playlist_name, and total_likes. Insert at least 8 sample rows with different users and playlists, making sure some playlists have the same user_id.

use music_streaming_app;

create table playlists2(
	id int primary key,
    user_id int,
	playlist_name varchar(100),
	total_like int 
);

insert into Playlists2 values
(1, 101, 'Bollywood Hits', 500),
(2, 101, 'Chill Vibes', 300),
(3, 101, 'Workout Mix', 450),
(4, 102, 'Romantic Songs', 600),
(5, 102, 'Party Hits', 250),
(6, 103, 'Lo-fi Beats', 400),
(7, 103, 'Morning Music', 200),
(8, 104, 'Trending Songs', 700);

select * from playlists2;

-- 2. Write a SQL query using ROW_NUMBER() and the OVER() clause to assign a unique row number to each playlist, ordered by total_likes in descending order.

select *, 
row_number() over(order by total_like desc) row_rn
from playlists2;

-- 3. Use the RANK() function with the OVER() clause to rank all playlists by total_likes, and display the playlist_name, user_id, total_likes, and their rank.

select playlist_name, user_id, total_like, 
rank() over(order by total_like desc) rn
from playlists2;

-- 4. Write a SQL query using DENSE_RANK() and PARTITION BY user_id to rank each user's playlists by total_likes, showing playlist_name, user_id, total_likes, and dense rank.

select playlist_name, user_id, total_like,
dense_rank() over(partition by user_id order by total_like desc) de_rn
from playlists2;

-- 5. Imagine you want to show the top 2 playlists per user based on total_likes, like Spotify's 'Your Top Playlists' feature. Write a query using a window function to select only the top 2 playlists for each user.

select * from(
	select * ,
	row_number() over(partition by user_id order by total_like desc) row_rn
	from playlists2
) as playlists
where row_rn <= 2;