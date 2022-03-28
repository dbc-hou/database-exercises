-- Albums released after 1991
select * from albums
where release_date > 1991;

-- Albums with genre "disco"
select * from albums
where genre like '%disco%';

-- Albums by Meat Loaf
select * from albums
where artist = 'Meat Loaf';