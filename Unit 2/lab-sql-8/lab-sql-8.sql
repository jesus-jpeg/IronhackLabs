# Lab | SQL Queries 8

USE Sakila;

### Instructions

#1. Rank films by length (filter out the rows with nulls or zeros in length column). Select only columns title, length and rank in your output.
SELECT title, length, DENSE_RANK() OVER (ORDER BY length DESC) AS Ranking
FROM film
WHERE length > 0;

#2. Rank films by length within the `rating` category (filter out the rows with nulls or zeros in length column). 
#In your output, only select the columns title, length, rating and rank.  
SELECT title, length, rating, DENSE_RANK() OVER (PARTITION BY rating ORDER BY length DESC) AS Ranking
FROM film
WHERE length > 0;

#3. How many films are there for each of the categories in the category table? 
#**Hint**: Use appropriate join between the tables "category" and "film_category".
SELECT c.category_id, c.name, COUNT(fc.film_id) AS num_films
FROM category AS c 
JOIN film_category AS fc ON c.category_id = fc.category_id
GROUP BY c.category_id, c.name
ORDER BY c.category_id asc;

#4. Which actor has appeared in the most films? 
#**Hint**: You can create a join between the tables "actor" and "film actor" and count the number of times an actor appears.
SELECT a.actor_id, concat(a.first_name," ", a.last_name) as name, COUNT(fa.film_id) AS appearances
FROM actor a 
JOIN film_actor fa 
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, name
ORDER BY appearances DESC
LIMIT 1;

#5. Which is the most active customer (the customer that has rented the most number of films)? 
#**Hint**: Use appropriate join between the tables "customer" and "rental" and count the `rental_id` for each customer.
SELECT c.customer_id, concat(c.first_name," ", c.last_name) as name, COUNT(r.rental_id) AS num_rentals
FROM customer c
JOIN rental r 
ON c.customer_id = r.customer_id
GROUP BY c.customer_id, name
ORDER BY num_rentals DESC
LIMIT 1;




###############################################
#**Bonus**: Which is the most rented film? (The answer is Bucket Brotherhood).

#This query might require using more than one join statement. Give it a try. We will talk about queries with multiple join statements later in the lessons.

#**Hint**: You can use join between three tables - "Film", "Inventory", and "Rental" and count the *rental ids* for each film.
################################################


SELECT f.film_id, f.title, count(f.film_id) as num_rentals
FROM film f
join inventory i
using (film_id)
join rental r
using(inventory_id)
group by f.film_id, f.title
order by num_rentals desc
limit 1;