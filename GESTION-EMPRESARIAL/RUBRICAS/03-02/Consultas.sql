## Me he bajado una base de datos de ejemplo desde http://www.postgresqltutorial.com/postgresql-sample-database/

select max(rental_rate) from film;
select avg(replacement_cost) from film where rating='NC-17'
select city from city inner join country on country.country_id=city.country_id where city like 'Z%'
select title from film inner join language on language.language_id=film.language_id where language.name='English'
select extract(month from rental.rental_date) from rental, payment where rental.rental_id = payment.rental_id 
select customer.first_name, customer.last_name from customer, rental where customer.customer_id = rental.customer_id and customer.last_name like 'M%'
select count( distinct customer.first_name) AS nombresUnicos from customer
select city from city where city like 'A%'
select city from city where city like '____'
select actor.first_name, actor.last_name from actor, film, film_actor where film_actor.actor_id = actor.actor_id and film_actor.film_id = film.film_id and film.title like 'A%'
