Create table If Not Exists Succeeded (
success_date date
);

Create table If Not Exists Failed (
fail_date date
);

insert into Failed (fail_date)
values ('2018-12-28'),('2018-12-29'),('2019-01-04'),('2019-01-05');

insert into Succeeded (success_date) values ('2018-12-30'),('2018-12-31'),
('2019-01-01'),('2019-01-02'),('2019-01-03'),('2019-01-06');

select * from Failed ; 
select * from succeeded; 

use ankit;

------
with cte as 
(
select 'failed' as period_start, fail_Date as event_Date 
from failed 
where date_format(fail_date , '%Y') = 2019

union all 
select 'succeeded' as period_start , success_Date as event_Date
from succeeded 
where date_format(success_Date,'%Y') = 2019 
)
##select * from cte 
 ,
 cte1 as 
 (
 select period_start , event_Date , lag(period_start,1,period_start) over(order by event_Date)  as prev_date from cte 
),
cte2 as
(
select *, sum(case when period_start = prev_date then 0 else 1 end ) over(order by event_Date) as groupbykey 
from cte1 
)

select  min(event_Date) , max(event_Date) ,count(1), period_start prev_date
from cte2
group by groupbykey

