USE sakila;

# 1. Use Sakila Database
SELECT *
FROM actor
LIMIT 100;


# 2. Get all the data from tables actor, film and customer
select *
FROM actor, film, customer;


# 3. Get film titles
select title
FROM film;


# 4. Get unique list of film languages under the alias language. 
# Note that we are not asking you to obtain the language per each film, 
# but this is a good time to think about how you might get that information in the future.
select distinct name as language 
from language;


# 5.1 Find out how many stores does the company have?
select count(store_id) as number_of_stores
from store;


# 5.2 Find out how many employees staff does the company have?
select count(staff_id) as number_of_employees
from staff;


# 5.3 Return a list of employee first names only?
select first_name as employees_firstname
from staff;

