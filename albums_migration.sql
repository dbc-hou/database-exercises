DROP TABLE IF EXISTS albums;

CREATE TABLE albums (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist VARCHAR(75),
    title VARCHAR(255),
    release_date INT,
    sales_in_millions INT,
    genre VARCHAR(255),
    PRIMARY KEY (id)
);