# Lab | SQL Subqueries

use sakila;

### Instructions

-- 1. How many copies of the film Hunchback Impossible exist in the inventory system?
select count(i.inventory_id) as num_copies
from inventory i
join film f  							#quick way
using (film_id)
where f.title = "Hunchback Impossible";

select count(i.inventory_id) as num_copies
from inventory i
where film_id in (select film_id		#subquery
from film
where title = "Hunchback Impossible");



-- 2. List all films whose length is longer than the average of all the films.
select title
from film
where length > (select avg(length)
from film);


-- 3. Use subqueries to display all actors who appear in the film Alone Trip.
select concat(a.first_name," ", a.last_name) as actor_name
from actor a
join film_actor fa
using (actor_id)					#quick way :)
join film f
using (film_id)
where f.title = "Alone Trip";

select concat(a.first_name," ", a.last_name) as actor_name
from actor a
where actor_id in( select actor_id
from film_actor fa
join film f							#subquery
using (film_id)
where f.title = "Alone Trip");




-- 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
-- Identify all movies categorized as family films.
select title
from film
where film_id in (select film_id
from film_category fc
join category c
using (category_id)
where c.name = "Family");



-- 5. Get name and email from customers from Canada using subqueries. Do the same with joins. 
-- Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
select concat(first_name," ",last_name), email
from customer
where address_id in (select address_id
from address 
join city
using (city_id)
join country
using (country_id)
where country = "Canada");



-- 6. Which are films starred by the most prolific actor? 
-- Most prolific actor is defined as the actor that has acted in the most number of films. 
-- First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.


select title
from film
join film_actor
using (film_id)
where actor_id in(select actor_id from(
select actor_id, count(film_id) as num_films
from film_actor
group by actor_id
order by num_films desc
limit 1) p ); #really weird, but I had to subquery the subquery to select the actor_id I needed




-- 7. Films rented by most profitable customer. 
-- You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments
select title
from film
join inventory 
using (film_id)
join rental
using (inventory_id)
where customer_id in (select customer_id from (
select customer_id, sum(amount) as total_amount
from payment
group by customer_id
order by total_amount desc
limit 1) p ); ##really similar to exercise 6


-- 8. Get the `client_id` and the `total_amount_spent` of those clients who spent more than the average of the `total_amount` spent by each client.

select avg(total_amount)
from (select customer_id, sum(amount) as total_amount
from payment
group by customer_id)p; ##avg is 112.548431


select customer_id, sum(amount) as total_amount_spent
from payment
group by customer_id
having sum(amount) > (select avg(total_amount)
from (select customer_id, sum(amount) as total_amount
from payment
group by customer_id) p)
order by total_amount_spent asc; ##perfect


