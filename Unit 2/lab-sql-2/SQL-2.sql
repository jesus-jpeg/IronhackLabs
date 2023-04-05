#LAB SQL 2
use sakila;
# 1. Select all the actors with the first name ‘Scarlett’.
	select *
    from actor
    where first_name = "Scarlett";

# 2. Select all the actors with the last name ‘Johansson’.
	select *
    from actor
    where last_name = "Johansson";

# 3. How many films (movies) are available for rent?
	select count(inventory_id)
	from inventory;
    
# 4. How many films have been rented?
	select count(distinct inventory_id)
    from rental;

# 5. What is the shortest and longest rental period?
	select max(rental_duration) as longest_rental_period, min(rental_duration) as shortest_rental_period
    from film;

# 6. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
	select max(length) as max_duration, min(length) as min_duration
    from film;

# 7. What's the average movie duration?
	select avg(length) as average_duration
    from film;

# 8. What's the average movie duration expressed in format (hours, minutes)?
	select concat(truncate(avg(length)/60,0),":", avg(length) % 60) as avg_dur_hhmm #hh:mm
    from film;
    
    #THERE SHOULD BE DEFINITELY AN EASIER WAY, BUT COULDNT FIND IT, SO...
    select concat(truncate(avg(length)/60,0),":", truncate(avg(length) % 60,0),":", truncate((avg(length)-truncate(avg(length),0))*60,0)) as avg_dur_hhmmss #hh:mm:ss
    from film;
    
# 9. How many movies longer than 3 hours?
	select count(film_id)
    from film
    where length > 60*3;

# 10. Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
	select lower(email)
    from customer;
    
# 11. What's the length of the longest film title?
	select title, length(title) as title_length
    from film
    where length(title) IN (
    select max(length(title))
    from film);
    
		