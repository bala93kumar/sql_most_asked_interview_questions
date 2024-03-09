## find number off repeat customers


create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);

insert into customer_orders values(
1,100,cast('2022-01-01' as date),2000),
(2,200,cast('2022-01-01' as date),2500),
(3,300,cast('2022-01-01' as date),2100),
(4,100,cast('2022-01-02' as date),2000),
(5,400,cast('2022-01-02' as date),2200),
(6,500,cast('2022-01-02' as date),2700),
(7,100,cast('2022-01-03' as date),3000),
(8,400,cast('2022-01-03' as date),1000),
(9,600,cast('2022-01-03' as date),3000);

select * from customer_orders; 

with first_visit_cte as (
select customer_id,min(order_date) as first_visit_date from customer_orders group by customer_id)
,
##select * from first_visit_cte

visit_flag as (
select customer_orders.*,first_visit_cte.first_visit_date,
case when customer_orders.order_date = first_visit_cte.first_visit_date then 1 else 0 end as new_customer_flag,
case when customer_orders.order_date != first_visit_cte.first_visit_date then 1 else 0 end as repeat_customer_flag
from customer_orders
join first_visit_cte
on customer_orders.customer_id = first_visit_cte.customer_id)
,

##select * from visit_flag 

customer_amount as (
select order_date,new_customer_flag ,repeat_customer_flag ,order_amount,
case when new_customer_flag = 1 then order_amount else 0 end as new_customer_amount,
case when repeat_customer_flag = 1 then order_amount else 0 end as repeat_customer_amount
from visit_flag )

select * from customer_amount 

select order_date,sum(new_customer_flag) as new_customer,sum(repeat_customer_flag) as repeat_customers,
sum(new_customer_amount) as new_customer_amount,sum(repeat_customer_amount) as repeat_customer_amount
from customer_amount
group by order_date; 


