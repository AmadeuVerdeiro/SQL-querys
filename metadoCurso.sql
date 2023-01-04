use sakila;
select 
	cus.customer_id,
	cus.first_name,
        cus.last_name,
	   SUM(amount) as total,
           COUNT(amount) as compras

from payment pay 
join customer as cus using(customer_id)

group by customer_id
  having total >=150 and compras >= 35
    order by total desc
--------------------------------------------------------------------------------

use sakila;
create or replace view vendas_por_cliente as
select 
	cus.customer_id,
    cus.first_name,
    cus.last_name,
    pay.amount
from customer cus
join payment pay
	on cus.customer_id = pay.payment_id
    order by pay.amount asc
