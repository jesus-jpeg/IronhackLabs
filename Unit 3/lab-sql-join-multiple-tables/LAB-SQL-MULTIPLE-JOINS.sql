# Lab | SQL Joins on multiple tables

Use Sakila;

### Instructions

#1. Write a query to display for each store its store ID, city, and country.
select s.store_id, ci.city, co.country
from store s
join address ad
using (address_id)
join city ci
using (city_id)
join country co
using (country_id)
;


#2. Write a query to display how much business, in dollars, each store brought in.
select sto.store_id, sum(p.amount) as total_income
from payment p
join staff sta
using (staff_id)		##RIGHT PATH
join store sto
using (store_id)
group by store_id;

SELECT s.store_id, SUM(p.amount) AS total_sales
FROM store s
JOIN customer c ON s.store_id = c.store_id
JOIN payment p ON c.customer_id = p.customer_id #WE LOSE SOME CUSTOMER_IDS HERE
GROUP BY s.store_id;

select count(distinct customer_id) from payment;

select count(customer_id) from customer;


#3. What is the average running time of films by category?
select c.name as category, avg(f.length) as avg_length
from film f
join film_category fc
using (film_id)
join category c
using (category_id)
group by c.name;


#4. Which film categories are longest?
select c.name as category, avg(f.length) as avg_length
from film f
join film_category fc
using (film_id)
join category c
using (category_id)
group by c.name
order by avg_length desc;


#5. Display the most frequently rented movies in descending order.
select title, count(rental_id) as rental_times
from rental r
join inventory 
using (inventory_id)
join film f
using (film_id)
group by title
order by rental_times desc;



#6. List the top five genres in gross revenue in descending order.
select name, sum(amount) as gross_revenue
from category
join film_category
using (category_id)
join film
using (film_id)
join inventory
using (film_id)
join rental
using (inventory_id)
join payment
using (rental_id)
group by name
order by gross_revenue desc
limit 5;


#7. Is "Academy Dinosaur" available for rent from Store 1?
select *
from store
join inventory
using (store_id)
join film
using (film_id)
where store_id = "1" and title = "ACADEMY DINOSAUR";

##YES, IT IS##



