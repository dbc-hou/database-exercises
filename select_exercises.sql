-- The name of all albums by Pink Floyd.
Select title from albums
Where artist = 'Pink Floyd';

-- The year Sgt. Pepper's Lonely Hearts Club Band was released
Select release_date from albums
Where title = 'Sgt. Pepper''s Lonely Hearts Club Band';

-- The genre for Nevermind
Select genre from albums
Where title = 'Nevermind';

-- Which albums were released in the 1990s
Select * from albums
Where release_date between 1990 and 1999;

-- Which albums had less than 20 million certified sales
Select * from albums
Where sales_in_millions < 20;

-- All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
Select * from albums
Where genre like '%Rock%';

