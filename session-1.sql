-- 1. Install MySQL or PostgreSQL on your system and create a new database named 'music_streaming_app' using the command line or GUI tool of your choice.

create database music_streaming_app ;
use music_streaming_app;

-- 2. Inside the 'music_streaming_app' database, create a table called 'playlists' with columns: playlist_id (integer, primary key), name (varchar), and created_by (varchar).

create table playlists (
    playlists_id int primary key,
    name varchar(100),
    created_by varchar(100)
);

-- 3. Insert three sample rows into the 'playlists' table representing playlists like 'Bollywood Hits', 'Chill Vibes', and 'Workout Mix', each created by a different user.

insert into playlists values 
(1, 'bollywood hits', 'kumar sanu'),
(2, 'chill vibes', 'astha gill'),
(3, 'workout mix', 'amit');

select * from playlists;

-- 4. Write an SQL SELECT query to display all playlists created by the user 'Amit' from the 'playlists' table.

select * from playlists
where created_by = "amit";

-- 5.  Open ChatGPT or Copilot and ask it to explain the difference between a table, a row, and a column in SQL using an example from a food delivery app like Zomato. Paste the explanation you receive into your assignment.

-- In SQL, a **table** is used to store and organize related data in rows and columns. A **column** represents a specific attribute or type of information, while a **row** represents one complete record in the table.

-- For example, consider a food delivery application like Zomato. We can create a `Restaurants` table to store restaurant information.

-- | id | name        | cuisine      | city      |
-- | -- | ----------- | ------------ | --------- |
-- | 1  | Spice Hub   | Indian       | Ahmedabad |
-- | 2  | Pizza House | Italian      | Surat     |
-- | 3  | South Treat | South Indian | Vadodara  |

-- - **Table:** `Restaurants` is the table that stores all restaurant-related information.
-- - **Column:** `id`, `name`, `cuisine`, and `city` are columns. Each column stores a particular type of information about a restaurant.
-- - **Row:** Each row represents one complete restaurant record. For example, `1, Spice Hub, Indian, Ahmedabad` represents one restaurant.

-- Therefore, a **table** is a collection of related data, a **column** defines a particular attribute, and a **row** represents an individual record.
