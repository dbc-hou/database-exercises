use david;
-- Create the database and four tables:
-- one user, many ads
-- many categories, many ads (via ad_category)

create database adlister;

create table users
(
    id       int unsigned not null auto_increment,
    email    varchar(100),
    first_name varchar(50),
    last_name varchar(75),
    password varchar(32),
        primary key (id)
);

create table ads
(
    id int unsigned not null auto_increment,
    category_id int not null,
    user_id int not null,
    title varchar (50),
    description text,
    primary key (id),
    foreign key (category_id, user_id)
);

create table categories
(
    id          int unsigned not null auto_increment,
    description varchar(50),
    primary key (id)
);

create table ad_categories
(
    ad_id int,
    category_id int,
    primary key (ad_id, category_id)
);

-- Create four queries as prescribed in the curriculum
-- 1. For a given ad, what is the email address of the user who created it?
select u.email, a.title, a.description
from users as u
    join ads as a on u.id = a.user_id
where a.id = [parameter];

-- 2. ...what category or categories does it belong to?
select c.description, a.title, a.description
from categories as c
    join ad_categories ac on c.id = ac.category_id
    join ads a on ac.ad_id = a.id
where a.id = [parameter];

-- 3. For a given category, show all the ads that are in that category.
select c.description, a.title, a.description
from categories as c
     join ad_categories ac on c.id = ac.category_id
     join ads a on ac.ad_id = a.id
where c.id = [parameter];

-- 4. For a given user, show all the ads they have posted.
select u.first_name, u.last_name, a.title, a.description
from users as u
     join ads as a on u.id = a.user_id
where u.id = [parameter];