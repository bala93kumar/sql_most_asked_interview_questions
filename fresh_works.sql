1. Freshworks sql interview questions. 



-- You are given the price of each sku whenever there is a change in price. Write an SQL to find the price at the start of each month.

create database ankit;
use ankit; 
create table sku 
(
sku_id int,
price_date date ,
price int
);

insert into sku values 
(1,'2023-01-01',10)
,(1,'2023-02-15',15)
,(1,'2023-03-03',18)
,(1,'2023-03-27',15)
,(1,'2023-04-06',20);

select * from sku; 

select *, day(price_date)  from sku where  day(price_date) = 1; 

with table1 
as
(
select * ,  row_number() over(partition by  sku_id,year(price_date), month(price_date)  order by price_date desc) as rn  from sku 
)
select sku_id , price_date as next_date, price from sku where day(price_date) = 1
union all
select  sku_id  , date_format( date_add(price_date, interval + 1 month),"%Y-%m-01") as next_date , price from table1 where rn = 1

