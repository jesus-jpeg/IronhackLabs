Use sakila;

## 1. Drop column picture from staff.
ALTER TABLE staff
DROP COLUMN picture;

## 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select * 
from customer
where first_name = "TAMMY" and last_name = "SANDERS";


insert into staff values (3, "Tammy", "Sanders", 79, "tammy.sanders@sakilastaff.com", 2, 1, "Tammy", "saodvfwo", "2023-2-25");

select * 
from staff;#check


## 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
##You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. 
##You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
select *
from rental
order by rental_id desc;#checking last rental_id

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';#getting customer_id

select *
from film;# lets see our film_id

select *
from inventory
where film_id = 1 and store_id = 1;#we check our inventory options

select *
from rental
where inventory_id between 1 and 4;#we check rentals of inventory_id

insert into rental values (16050, current_timestamp, 1 ,130, current_timestamp+5, 1, current_timestamp); ##returndate 5 secons lates :)

select *
from rental
order by rental_id desc;##justt to check everything worked

-- Use similar method to get inventory_id, film_id, and staff_id.

## 4. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:

-- Check if there are any non-active users
select * from customer
where active = 0; #there are 15

-- Create a table backup table as suggested
create table deleted_users (
customer_id int default null,
email text collate utf8mb4_unicode_ci,
date date);

-- Insert the non active users in the table backup table
insert into deleted_users
select customer_id, email, current_timestamp from customer
where active = 0;#inserting all values from customer table


select *
from deleted_users;#check everything is right

-- Delete the non active users from the table customer


set foreign_key_checks=0;
delete from customer 
where active = 0
;

select * from customer
where active = 0;#everything is ok
