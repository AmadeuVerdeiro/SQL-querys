use sakila;
select 
		cus.customer_id,
		cus.first_name,
        cus.last_name,
		sum(amount) as total,
        COUNT(amount) as compras

from payment pay 
join customer as cus using(customer_id)

group by customer_id
having total >=150 and compras >= 35
order by total desc
