
use ankit ; 

create table players_location
(
name varchar(20),
city varchar(20)
);
delete from players_location;

insert into players_location
values ('Sachin','Mumbai'),('Virat','Delhi') , ('Rahul','Bangalore'),('Rohit','Mumbai'),('Mayank','Bangalore');

select * from players_location; 

select 
max(case when city="Bangalore" THEN name  end )as 'Bangalore', 
max(case when city="Delhi" THEN name  end) as 'Delhi', 
max(case when city="Mumbai" THEN name  end )as 'Mumbai' , 
rnk
from 
(
select  name , city , row_number() over(partition by city order by name ) as rnk 
from players_location
)a 
group by rnk


-----------------
drop table color

---colors 

create table color(
 col1 varchar(10),
 col2 varchar(4),
 col3 varchar(5),
 col4 varchar(5),
 col5 varchar(5)
)

insert into color values
('colors','paul','john','tim','eric'),
('Red','1','5','1','3'),
('Green','8','4','3','5'),
('Blue','2','2','9','1')

select * from color 

select 
case when  rank =1 then 
select  colors , paul , john , tim, eric, row_number() over(  order by colors  ) as rnk  from colors 

SELECT
      col1,
      MAX(IF( col2 = 'paul', col1, NULL)) AS `paul`,
    --   MAX(IF(`subject` = 'english language', `grade`, NULL)) AS `english language`,
--       MAX(IF(`subject` = 'economics', `grade`, NULL)) AS `economics`,
--       MAX(IF(`subject` = 'government', `grade`, NULL)) AS `government`,
--       MAX(IF(`subject` = 'biology', `grade`, NULL)) AS `biology`,
--       MAX(IF(`subject` = 'chemistry', `grade`, NULL)) AS `chemistry`,
--       MAX(IF(`subject` = 'physics', `grade`, NULL)) AS `physics`
FROM color
GROUP BY  col1;