
create table survey (
surver_id int, 
text varchar(30))

drop table survey ; 

insert into survey values
(12,'weekely_1'),
(12,'monthly_1'),
(13,'weekely_2'),
(14,'monthly_3'),
(14,'monthly_4'),
(15,'weekely_1'),
(15,'monthly_1')


select * from survey; 


with cte as 
(
select surver_id , substring_index(text,'_',1) as name from survey
)

##select surver_id , name from cte

select a.surver_id  , a.name , b.name
from cte a 
join cte b 
on a.surver_id = b.surver_id
-- and a.name = 'weekely'
-- and b.name = 'monthly'

