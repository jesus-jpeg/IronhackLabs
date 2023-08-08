-- Instructions
Use Sakila;
### In this lab we will find the customers who were active in consecutive months of May and June. Follow the steps to complete the analysis.

-- Create a table rentals_may to store the data from rental table with information for the month of May.
CREATE TABLE rentals_may (
  rental_id int default null,
	rental_date date,
	inventory_id int default null,
    customer_id int default null,
    return_date date,
    staff_id int default null,
    last_update date
  );
-- Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
insert into rentals_may
select * from rental where date_format(rental_date , "%M") = "May";


select count(rental_id) from rentals_may;

-- Create a table rentals_june to store the data from rental table with information for the month of June.

CREATE TABLE rentals_june (
  rental_id int default null,
	rental_date date,
	inventory_id int default null,
    customer_id int default null,
    return_date date,
    staff_id int default null,
    last_update date
  );
  
-- Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
insert into rentals_june
select * from rental where date_format(rental_date , "%M") = "June";

select count(rental_id) from rentals_june;

-- Check the number of rentals for each customer for May.
select customer_id, count(distinct rental_id) as num_rentals from rentals_may
group by customer_id;

-- Check the number of rentals for each customer for June.
select customer_id, count(distinct rental_id) as num_rentals from rentals_june
group by customer_id;

