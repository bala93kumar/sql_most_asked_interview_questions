use ankit;

## https://www.youtube.com/watch?v=G30SBzzLL_U

create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup;

with cte as 
(
select team_1 as team_name , case when winner=Team_1 then 1 else 0 end as win ,
case when  winner!=Team_1 and winner!= 'DRAW' then 1 else 0  end as loss  ,
CASE when winner='DRAW' then 1 else 0 end as draw
from icc_world_cup
union all 
select team_2 as team_name , case when winner=Team_2 then 1 else 0 end as win ,
case when  winner!=Team_2 and winner!= 'DRAW' then 1 else 0  end as loss  ,
CASE when winner='DRAW' then 1 else 0 end as draw
from icc_world_cup
)
select team_name , count(team_name)
from 
cte
group by 1
