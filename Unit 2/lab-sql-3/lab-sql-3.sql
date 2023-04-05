###LAB SQL 3
USE sakila;

-- 1. How many distinct (different) actors' last names are there?
select count(distinct last_name) as number_diff_lastnames
from actor;#121

-- 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct language_id)
from film;#1

-- 3. How many movies were released with "PG-13" rating?
select count(film_id)
from film
where rating = "PG-13";#223

-- 4. Get 10 the longest movies from 2006.
select *
from film
where release_year = "2006"
order by length desc
limit 10;

-- 5. How many days has been the company operating (check DATEDIFF() function)?
select min(rental_date) #lower date I could find
from rental; #2005-05-24

select max(last_update) #higher date I could find
from rental; ##2006-02-23

select datediff(max(last_update),min(rental_date)) as company_life
from rental;##275 days

-- 6. Show rental info with additional columns month and weekday. Get 20.
select *, date_format(rental_date, "%W") as rental_weekday, date_format(rental_date, "%M") as rental_month,date_format(return_date, "%W") as return_weekday, date_format(return_date, "%M") as return_month
from rental
limit 20;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, DAYNAME(rental_date) as weekday,
CASE
	WHEN (DAYNAME(rental_date) = "Saturday" or DAYNAME(rental_date) = "Sunday") THEN "weekend" 
	ELSE "workday"
    END as day_type
from rental;

-- 8. How many rentals were in the last month of activity?
#Check the last day
select max(last_update) as last_day
from rental; ##2006-02-23

##Final solution
select count(rental_id) as rentals_lastmonth
from rental
where datediff("2006-02-23", DATE_FORMAT(rental_date,"%Y-%m-%d")) < 30;#182