USE Sakila;

#1. List the number of films per category.

SELECT C.category_id, C.name, COUNT(FC.film_id) AS num_film
FROM category AS C
INNER JOIN film_category AS FC
ON C.category_id=FC.category_id
GROUP BY C.category_id, C.name
ORDER BY num_film DESC;


#2. Display the first and the last names, as well as the address, of each staff member.
SELECT S.first_name, S.last_name, A.address 
FROM staff AS S
INNER JOIN address AS A
ON S.address_id= A.address_id;

#3. Display the total amount rung up by each staff member in August 2005.

SELECT S.staff_id, S.first_name, S.last_name, SUM(P.amount) AS total_amount
FROM staff AS S
INNER JOIN payment AS P
ON S.staff_id= P.staff_id
WHERE P.payment_date LIKE '2005-08-%'
GROUP BY S.staff_id, S.first_name, S.last_name;

#4. List all films and the number of actors who are listed for each film.
SELECT F.film_id, F.title, COUNT(FA.actor_id) AS actor_num
FROM film AS F
Inner Join film_actor AS FA
ON F.film_id= FA.film_id
GROUP BY F.film_id, F.title;

#5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT C.customer_id, C.first_name, C.last_name, SUM(P.amount)AS total_amount
FROM customer AS C
INNER JOIN payment AS P
ON C.customer_id=P.customer_id
GROUP BY C.customer_id, C.first_name, C.last_name
ORDER BY C.last_name ASC;
