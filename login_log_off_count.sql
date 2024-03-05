#login log out count 

create table event_status
(
event_time varchar(10),
status varchar(10)
);

insert into event_status 
values
('10:01','on'),('10:02','on'),('10:03','on'),('10:04','off'),('10:07','on'),('10:08','on'),('10:09','off')
,('10:11','on'),('10:12','off');

select * from event_status ; 

with cte as(
select * , sum(case when previous_status = 'off' and status = 'on' then 1 else 0 end ) over(order by event_time ) as groupbykey from  
(
select event_time , status , lag(status,1,status) over(order by event_time) as previous_status
from event_status
) a
)
##select * from cte 
select  min(event_time) , max(event_time) , count(1) , groupbykey from cte  group by groupbykey






-- with cte as(
-- select event_time, status, sum(case when status='on' then 1 else 0 end) over (order by event_time) as grp
-- from event_status)


-- with cte as(
-- select event_time, status, sum(case when status='on' then 0 else 1 end  ) over (order by event_time) as grp
-- from event_status)
-- -- select * from cte
-- select min(event_time) as in_time , max(event_time) as out_time, count(1) as cnt
-- from cte
-- group by status 