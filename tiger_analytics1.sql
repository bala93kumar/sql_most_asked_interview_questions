use ankit ; 

create table family 
(
person varchar(5),
type varchar(10),
age int
);
insert into family values ('A1','Adult',54)
,('A2','Adult',53),('A3','Adult',52),('A4','Adult',58),('A5','Adult',54),('C1','Child',20),('C2','Child',19),('C3','Child',22),('C4','Child',15);

select * from family; 

with cte  as
(
select * , substring(person,2,2) as number , substring(person,1,1) as aorc from family
)
,
adult as 
(
select * from cte where aorc  = 'A'
)
,
child as
( 
select * from cte where aorc  = 'C'

)

select a.person,b.person
from adult a 
left join 
child b 
on 
a.number = b.number

