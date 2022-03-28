use david;

truncate albums;

insert into albums (artist, title, release_date, sales_in_millions, genre)
values ('Michael Jackson', 'Thriller', 1982, 49.2,'Pop, post-disco, funk, rock')
, ('AC/DC', 'Back in Black', 1980, 29.5, 'Hard rock')
, ('Whitney Houston', 'The Bodyguard', 1992, 32.4, 'R&B, soul, pop, soundtrack')
, ('Meat Loaf', 'Bat out of Hell', 1977, 21.7, 'Hard rock, glam rock, progressive rock')
, ('Eagles', 'Their Greatest Hits (1971-1975', 1976, 41.2, 'Country rock, soft rock, folk rock');