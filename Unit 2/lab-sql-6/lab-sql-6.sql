# Lab | SQL Queries 6

USE SAKILA;

## We have just one item for each film, and all will be placed in the new table. For 2020, the rental duration will be 3 days, with an offer price of `2.99€` and a replacement cost of `8.99€` (these are all fixed values for all movies for this year). The catalog is in a CSV file named **films_2020.csv** that can be found at `files_for_lab` folder.

### Instructions

# - Add the new films to the database.
# - Update information on `rental_duration`, `rental_rate`, and `replacement_cost`.

### Hint

##- You might have to use the following commands to set bulk import option to `ON`:

#```sql
#show variables like 'local_infile';
#set global local_infile = 1;
#```

#- If bulk import gives an unexpected error, you can also use the `data_import_wizard` to insert data into the new table.
##########
#SOLUTION#
##########
USE sakila;

drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;
show variables like 'local_infile';
set global local_infile = 1;
# Add the new films to the database. (I used data import wizard)
SELECT *
FROM films_2020;

# Update information on rental_duration, rental_rate, and replacement_cost.
UPDATE films_2020
SET rental_duration = 3, rental_rate = 2.99, replacement_cost = 8.99;

SELECT *
FROM films_2020;