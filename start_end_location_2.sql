use ankit; 

drop table flight_travel
 
create table flight_travel(
cust_id int , 
flight_id varchar(10), 
origin varchar(4),
destination varchar(4)
)

insert into flight_travel values
(1,'flight1','D','H'),
(1,'flight2','H','K'), 
(1,'flight3','K','M'),
(2,'flight1','M','A'),
(2,'flight2','A','G')

with cte as 
(
select cust_id  ,origin , destination,  row_number() over(partition by cust_id order by flight_id ) as rnk
from flight_travel 
) ,
 cte2 as
 (
select cust_id   , min(rnk) as strt , max(rnk) as end 
from cte 
group by cust_id 
)

select .*,b.*  from cte  a
join cte2 b
on a.cust_id = b.cust_id  



-------------------------------------

flight travel ankit 

drop table travel_datA

CREATE TABLE travel_data (
 customer VARCHAR(10),
 start_loc VARCHAR(50),
 end_loc VARCHAR(50)
);


INSERT INTO travel_data (customer, start_loc, end_loc) VALUES
 ('c1', 'New York', 'Lima'),
 ('c1', 'London', 'New York'),
 ('c1', 'Lima', 'Sao Paulo'),
 ('c1', 'Sao Paulo', 'New Delhi'),
 ('c2', 'Mumbai', 'Hyderabad'),
 ('c2', 'Surat', 'Pune'),
 ('c2', 'Hyderabad', 'Surat'),
 ('c3', 'Kochi', 'Kurnool'),
 ('c3', 'Lucknow', 'Agra'),
 ('c3', 'Agra', 'Jaipur'),
 ('c3', 'Jaipur', 'Kochi');
 
 select * from travel_data; 
 
 
 
select o.*  , 
case when  d.end_loc is null then o.start_loc end  as starting_location 
   from 
travel_data  o 
left join 
travel_data d 
on 
o.customer = d.customer and  o.start_loc  = d.end_loc
left join travel_date d1 on  o.customer = d1.customer  and   o.end_loc = d.start_loc


select customer , start_loc from travel_data
