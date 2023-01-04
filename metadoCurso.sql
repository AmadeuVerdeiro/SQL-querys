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
    
-------------------------------------------------------------------------------------
USE CARROS;
create table marcas (
	id int not null auto_increment,
    nome_marca varchar(255) not null,
    origem varchar(255) not null,
    primary key (id)
);

alter table marcas add origem varchar(255)


create table iventario(
	id int not null auto_increment,
    modelo varchar(255) not null,
    transmissao varchar(255) not null,
    motor varchar(255) not null,
    combustivel varchar(255) not null,
    marcas_id int not null,
    primary key (id),
    foreing key (marcas_id) references marcas(id)
);


-----------------------------------------------------------------------
use carros;
insert into marcas (nome_marca, origem)
values
("opel", "Alemanhã"),
("reanault", "França"),
("Ferrari", "Alemanhã"),
("Seat", "Espanha"),
("Fiat", "Italia");

