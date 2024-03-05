# find the count of customers added each month 


CREATE TABLE sales 
(
    order_date date,
    customer VARCHAR(512),
    qty INT
);

INSERT INTO sales (order_date, customer, qty) VALUES ('2021-01-01', 'C1', '20');
INSERT INTO sales (order_date, customer, qty) VALUES ('2021-01-01', 'C2', '30');
INSERT INTO sales (order_date, customer, qty) VALUES ('2021-02-01', 'C1', '10');
INSERT INTO sales (order_date, customer, qty) VALUES ('2021-02-01', 'C3', '15');
INSERT INTO sales (order_date, customer, qty) VALUES ('2021-03-01', 'C5', '19');
INSERT INTO sales (order_date, customer, qty) VALUES ('2021-03-01', 'C4', '10');
INSERT INTO sales (order_date, customer, qty) VALUES ('2021-04-01', 'C3', '13');
INSERT INTO sales (order_date, customer, qty) VALUES ('2021-04-01', 'C5', '15');
INSERT INTO sales (order_date, customer, qty) VALUES ('2021-04-01', 'C6', '10');

select * from sales; 

select  yearmonth , count(distinct customer) from 
(
 select   DATE_FORMAT(order_date , '%Y-%m') as yearmonth , customer , qty , row_number() over(partition by customer order by yearmonth) as row_num
 from 
(
select order_date , DATE_FORMAT(order_date , '%Y-%m') as yearmonth , customer , qty 
from sales 
) a
) b 
where  row_num = 1
group by yearmonth