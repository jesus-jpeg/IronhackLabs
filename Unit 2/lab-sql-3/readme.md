![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Lab | SQL Queries 3

In this lab, you will be using the [Sakila](https://dev.mysql.com/doc/sakila/en/) database of movie rentals. You have been using this database for a couple labs already, but if you need to get the data again, refer to the official [installation link](https://dev.mysql.com/doc/sakila/en/sakila-installation.html).

The database is structured as follows:
![DB schema](https://education-team-2020.s3-eu-west-1.amazonaws.com/data-analytics/database-sakila-schema.png)

<br><br>

### Instructions

1. How many distinct (different) actors' last names are there?
2. In how many different languages where the films originally produced? (Use the column `language_id` from the `film` table)
3. How many movies were released with `"PG-13"` rating?
4. Get 10 the longest movies from 2006.
5. How many days has been the company operating (check `DATEDIFF()` function)?
6. Show rental info with additional columns month and weekday. Get 20.
7. Add an additional column `day_type` with values 'weekend' and 'workday' depending on the rental day of the week.
8. How many rentals were in the last month of activity?
