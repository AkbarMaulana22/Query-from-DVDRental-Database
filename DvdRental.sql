/*a customer wants to know the films about "astronaut" */
select film_id,title,description from film where description ilike '%astronaut%';

/*How many film have rating of "R" and replacement cost between $5 and 15$*/
select film_id,title from film where rating='R' and replacement_cost between 5 and 15;

/*How many payments did each staff member handle and how much was the total amount processed by each staff member*/
select staff_id,count(payment_id) as count_of_payment,sum(amount) as total_amount from payment group by staff_id;

/*Average replacement cost of movies by rating*/
select rating, avg(replacement_cost) as average_replacement_cost from film group by rating;

/*5 Customer who spent the most amount of money*/
select a.first_name,a.last_name,a.email,sum(b.amount) as spent_amount from customer a
inner join
payment b on a.customer_id =b.customer_id
group by a.customer_id order by spent_amount desc limit 5; 

/*How many copies of each movie in each store do we have*/
select store_id,film_id,count(film_id) as stock from inventory group by film_id,store_id order by store_id,film_id;

/*Customer are eligible for our platinum credit*/
select a.first_name,a.last_name,a.email from customer a 
inner join
payment b on a.customer_id =b.customer_id
group by a.customer_id
having count(b.payment_id)>=40;