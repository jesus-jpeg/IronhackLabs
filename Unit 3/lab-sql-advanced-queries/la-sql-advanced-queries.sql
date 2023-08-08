# Lab | SQL Advanced queries

Use Sakila;

### Instructions

#1. List each pair of actors that have worked together.
with actors1 as (select a.film_id, a.actor_id as actor_id1, b.actor_id as actor_id2
from film_actor a
join film_actor b
on a.film_id = b.film_id
and a.actor_id<b.actor_id)
select actor_id1, actor_id2, f.title
from actors1 c
join film f
on c.film_id = f.film_id; #just tried to do it another way but we cant just avoid to do cte here

-- from cross_join lab
select f.title, a.actor_id, b.actor_id
from film_actor a
join film_actor b
on a.film_id = b.film_id
and a.actor_id<b.actor_id
join film f
on b.film_id = f.film_id;




#2. For each film, list actor that has acted in more films.
with actors_apps as (
	select actor_id, count(film_id) as apps
	from film_actor
	group by actor_id),
ranking as(
	select f.film_id, f.actor_id, a.apps, RANK() OVER (PARTITION BY film_id ORDER BY apps desc) AS rank_actors
	from film_actor f
	join actors_apps a
	using (actor_id))
select film_id, actor_id, apps
from ranking
where rank_actors=1; #I think it is like this :S (I'm pretty sure it could be done easier/cleaner)

