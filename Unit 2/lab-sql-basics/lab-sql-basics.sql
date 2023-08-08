
USE bank;
## LAB SQL Basics
-- ## Instructions

-- Assume that any `_id` columns are incremental, meaning that higher ids always occur after lower ids. 
-- For example, a client with a higher `client_id` joined the bank after a client with a lower `client_id`.

-- ### Query 1

-- Get the `id` values of the first 5 clients from `district_id` with a value equals to 1.

select client_id, district_id
from client
where district_id = 1
limit 5;

-- ### Query 2

-- In the `client` table, get an `id` value of the last client where the `district_id` equals to 72.

select max(client_id)
from client
where district_id = 72;

-- ### Query 3

-- Get the 3 lowest amounts in the `loan` table.

select amount
from loan
order by amount asc
limit 3;

-- ### Query 4

-- What are the possible values for `status`, ordered alphabetically in ascending order in the `loan` table?

select distinct status
from loan
order by status asc;

-- ### Query 5

-- What is the `loan_id` of the highest payment received in the `loan` table?

select loan_id, payments
from loan
order by payments desc
limit 1;

-- ### Query 6

-- What is the loan `amount` of the lowest 5 `account_id`s in the `loan` table? Show the `account_id` and the corresponding `amount`
select amount, account_id
from loan
order by account_id asc
limit 5;


-- ### Query 7

-- What are the `account_id`s with the lowest loan `amount` that have a loan `duration` of 60 in the `loan` table?

select account_id, amount, duration
from loan
where duration = 60
order by amount asc
limit 5;


-- ### Query 8

-- What are the unique values of `k_symbol` in the `order` table?

-- Note: There shouldn't be a table name `order`, since `order` is reserved from the `ORDER BY` clause. You have to use backticks to escape the `order` table name.

select distinct(k_symbol)
from bank.order;

-- ### Query 9

-- In the `order` table, what are the `order_id`s of the client with the `account_id` 34?

select order_id
from bank.order
where account_id = 34;


-- ### Query 10

-- In the `order` table, which `account_id`s were responsible for orders between `order_id` 29540 and `order_id` 29560 (inclusive)?
select distinct account_id
from bank.order
where order_id between 29540 and 29560;


-- ### Query 11

-- In the `order` table, what are the individual amounts that were sent to (`account_to`) id 30067122?
select amount
from bank.order
where account_to = 30067122;


-- ### Query 12

-- In the `trans` table, show the `trans_id`, `date`, `type` and `amount` of the 10 first transactions from `account_id` 793 in chronological order, from newest to oldest.
select trans_id, date, type, amount 
from trans
where account_id = 793
order by date desc
limit 10;


-- ### Query 13

-- In the `client` table, of all districts with a `district_id` lower than 10, how many clients are from each `district_id`? Show the results sorted by the `district_id` in ascending order.

select count(client_id)
from client
where district_id < 10
group by district_id
order by district_id asc
;



-- ### Query 14

-- In the `card` table, how many cards exist for each `type`? Rank the result starting with the most frequent `type`.
select type, count(card_id) as number_cards
from card
group by type
order by number_cards desc
;

-- ### Query 15

-- Using the `loan` table, print the top 10 `account_id`s based on the sum of all of their loan amounts.
select account_id, sum(amount) as suma
from loan
group by account_id
order by suma desc
limit 10;


-- ### Query 16

-- In the `loan` table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order.
select date, count(loan_id)
from loan
where date < 930907
group by date
order by date desc;

-- ### Query 17

-- In the `loan` table, for each day in December 1997, count the number of loans issued for each unique loan duration, ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.
select date, duration, count(loan_id)
from loan
where date regexp '9712'
group by date, duration
order by date asc, duration asc;


-- ### Query 18

-- In the `trans` table, for `account_id` 396, sum the amount of transactions for each type (`VYDAJ` = Outgoing, `PRIJEM` = Incoming). 
#Your output should have the `account_id`, the `type` and the sum of amount, named as `total_amount`. Sort alphabetically by type.
select account_id, type, sum(amount) as total_amount
from trans
where account_id = 396
group by type
order by type asc;


-- ### Query 19

-- From the previous output, translate the values for `type` to English, rename the column to `transaction_type`, round `total_amount` down to an integer
select account_id, REPLACE(REPLACE(type, "PRIJEM","INCOMING"), "VYDAJ","OUTGOING") as transaction_type, round(sum(amount),0) as total_amount
from trans
where account_id = 396
group by type
order by type asc;


-- ### Query 20

-- From the previous result, modify your query so that it returns only one row, with a column for incoming amount, outgoing amount and the difference.

-- Expected result:

-- ```shell
-- 396	1028138	1485814	-457676
-- ```

-- ### Query 21

-- Continuing with the previous example, rank the top 10 `account_id`s based on their difference.

-- Expected result:

-- ```shell
-- 9707	869527
-- 3424	816372
-- 3260	803055
-- 2486	735219
-- 1801	725382
-- 4470	707243
-- 3674	703531
-- 9656	702786
-- 2227	696564
-- 6473	692580
-- ```
