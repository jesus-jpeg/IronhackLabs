USE sakila;

### Instructions

#1. Get all pairs of actors that worked together.
select f.title, a.actor_id, b.actor_id
from film_actor a
join film_actor b
on a.film_id = b.film_id
and a.actor_id<b.actor_id
join film f
on b.film_id = f.film_id;

#2. Get all pairs of customers that have rented the same film more than 3 times.
select c.film_id, a.customer_id as customer_a, b.customer_id as customer_b, count(*) as num_rentals
from rental a
join rental b
on a.inventory_id = b.inventory_id and a.customer_id<b.customer_id
join inventory c
on b.inventory_id=c.inventory_id
group by c.film_id, a.customer_id, b.customer_id
having count(*) >= 2;## there isnt any with 3 rentals, only one row with 2 rentals.



#3. Get all possible pairs of actors and films.
select concat(actor.first_name," ",actor.last_name) as name, film.title
from actor
cross join film;