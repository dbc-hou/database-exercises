# put your answers in this file

# Question 1: Fetch id, first name, last name, and age for all owners
select id, first_name, last_name, age from owners;

# Question 2: Fetch id, first name, last name, and age for owners who have a last name of Smith
select id, first_name, last_name, age
from owners
where last_name = 'Smith';

# Question 3: Fetch id, first name, last name, and age for owners who have a last name STARTING WITH Smith
select id, first_name, last_name, age
from owners
where last_name like 'Smith%';

# Question 4: Fetch year and the average mileage for all cars. Use the AVG aggregate function with a GROUP BY year clause.
select year, avg(mileage) from cars
group by year;

# Question 5: Fetch owner names (first and last), age, car vins, year, mileage, and years_owned
select o.first_name, o.last_name, o.age, c.vin, c.year, c.mileage, co.years_owned
from owners o
join car_owners co on o.id = co.owner_id
join cars c on co.car_id = c.id;

# Question 6: Fetch all vins, years, and model_names for Ford cars
select c.vin, c.year, m.model_name
from cars c
join models m on m.id = c.model_id
join makes m2 on m.make_id = m2.id
where m.make_id in (
    select id
    from makes
    where make_name = 'Ford'
);

# Question 7:
# Assuming that the Ford Taurus is a record in the model table
# with an id of 2, insert a new car record
# that is a Ford Taurus with a vin of ABC123,
# year of 1990, and mileage of 320000
insert into cars (vin, year, mileage, model_id)
values ('ABC123',1990,32000,2);

# Question 8:
# For the car with a vin of XYZ001,
# change its year to 2005 and its mileage to 120000.
# Do this with a single update statement.
update cars
set year = 2005, mileage = 120000
where vin = 'XYZ001';

# Question 9:
# Fetch the make_name, model_name,
# and the # of cars per make and model
# sorted by make_name and then model_name.
# Please name the # of cars column "count_of_cars"
select mk.make_name, md.model_name,count(c.id) as count_of_cars
from makes mk
join models md on mk.id = md.make_id
join cars c on md.id = c.model_id
group by mk.make_name, md.model_name;

# Question 10:
# Fetch the id, first_name, and last_name
# of all owners who DO NOT own a car
select o.id, o.first_name, o.last_name
from owners o
left join car_owners co on o.id = co.owner_id
where co.car_id is null;

