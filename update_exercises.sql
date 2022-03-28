-- Write SELECT statements to output each of the following with a caption:
--
--     All albums in your table.
Select * from albums;

--     All albums released before 1980
Select * from albums
Where release_date < 1980;

--     All albums by Michael Jackson
Select * from albums
Where artist = 'Michael Jackson';

-- After each SELECT add an UPDATE statement to:
--
--     Make all the albums 10 times more popular (sales * 10)
UPDATE albums
SET sales_in_millions = sales_in_millions * 10;
SELECT * from albums;

--     Move all the albums before 1980 back to the 1800s.
UPDATE albums
SET release_date = release_date - 100
WHERE release_date < 1980;

SELECT * from albums
WHERE release_date < 1980;

--     Change 'Michael Jackson' to 'Peter Jackson'
UPDATE albums
SET artist = 'Peter Jackson'
WHERE artist = 'Michael Jackson';

SELECT * from albums
WHERE artist like '%Jackson%';
--
-- Add SELECT statements after each UPDATE so you can see the results of your handiwork.


