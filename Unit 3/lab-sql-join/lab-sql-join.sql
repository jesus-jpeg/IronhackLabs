# Lab | SQL Join

USE sakila;

### Instructions

# 1. List the number of films per `category`.
select category.name, count(film_id) as num_of_films 
from category
join film_category
on category.category_id = film_category.category_id
group by name;


# 2. Display the first and the last names, as well as the address, of each staff member.
select first_name, last_name, address.address
from staff
join address
on address.address_id = staff.address_id;


# 3. Display the total amount rung up by each staff member in August 2005.
select sum(amount) from payment 
where payment_date regexp "^2005-08"
group by staff_id;



# 4. List all films and the number of actors who are listed for each film.
select film.title, count(film_actor.actor_id) as num_of_actors
from film_actor
join film
on film.film_id = film_actor.film_id
group by title
;


# 5. Using the `payment` and the `customer` tables as well as the JOIN command, list the total amount paid by each customer. 
#    List the customers alphabetically by their last names.
select customer.last_name, sum(payment.amount) as total_paid
from payment
join customer
on customer.customer_id = payment.customer_id
group by first_name, last_name
order by last_name asc;