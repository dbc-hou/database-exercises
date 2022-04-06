# DROP DATABASE IF EXISTS codeup_mysql_assessment;
# CREATE DATABASE IF NOT EXISTS codeup_mysql_assessment;

# USE codeup_mysql_assessment;

# make the tables

CREATE TABLE owners (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL DEFAULT '',
    last_name VARCHAR(255) NOT NULL DEFAULT '',
    age INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (id)
);

CREATE TABLE makes (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    make_name VARCHAR(255) NOT NULL DEFAULT '',
    PRIMARY KEY (id)
);

CREATE TABLE models (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    model_name VARCHAR(255) NOT NULL DEFAULT '',
    make_id INT UNSIGNED NOT NULL DEFAULT 1,
    PRIMARY KEY (id),
    FOREIGN KEY (make_id) REFERENCES makes(id)
);

CREATE TABLE cars (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    vin VARCHAR(50) NOT NULL DEFAULT '',
    year INT UNSIGNED NOT NULL DEFAULT 2000,
    mileage INT UNSIGNED NOT NULL DEFAULT 0,
    model_id INT UNSIGNED NOT NULL DEFAULT 1,
    PRIMARY KEY (id),
    FOREIGN KEY (model_id) REFERENCES models(id)
);

CREATE TABLE car_owners (
    car_id INT UNSIGNED NOT NULL,
    owner_id INT UNSIGNED NOT NULL,
    years_owned INT UNSIGNED NOT NULL,
    PRIMARY KEY (car_id, owner_id),
    FOREIGN KEY (car_id) REFERENCES cars(id),
    FOREIGN KEY (owner_id) REFERENCES owners(id)
);

# insert some data

INSERT INTO makes (make_name) VALUES ('Unknown'), ('Ford'), ('Nissan'), ('Honda'), ('Toyota');

INSERT INTO models (model_name, make_id) VALUES ('Unknown', 1), ('Taurus', 2), ('F-150', 2), ('Altima', 3), ('Maxima', 3), ('Accord', 4), ('Tundra', 5), ('Prius', 5), ('Model T',2);

INSERT INTO owners (first_name, last_name, age) VALUES ('Bob', 'Smith', 42), ('Sue', 'Williams', 25), ('Tom', 'Jones', 67), ('Waylon', 'Smithers, Jr.', 999), ('Jill', 'Smith', 40), ('Anita', 'Break', 38), ('Horatio', 'Smithsonian', 77), ('Jimmy', 'Joebob', 57), ('Bill', 'Williams', 31), ('Smokey', 'The Bear', 64), ('John', 'Yayas', 71);

INSERT INTO cars (vin, year, mileage, model_id) VALUES ('AAA111', 2010, 100000, 2), ('BBB222', 2015, 65000, 3), ('CCC333', 2010, 140000, 4), ('DDD444', 2020, 30000, 5), ('EEE555', 2017, 80000, 6), ('FFF666', 2011, 190000, 7), ('GGG777', 2010, 210000, 8), ('HHH888', 2011, 142000, 1), ('III999', 2020, 35000, 3), ('JJJ000', 1995, 322000, 2), ('NUKES', 1905, 999999, 9), ('XYZ001', 2008, 144000, 7);

INSERT INTO car_owners (car_id, owner_id, years_owned) VALUES (1, 1, 10), (2, 1, 5), (3, 2, 7), (4, 3, 1), (5, 3, 3), (6, 3, 7), (11, 4, 110), (1, 5, 10), (7, 6, 8),  (8, 7, 9), (9, 8, 1), (10, 9, 20), (12, 11, 12);
