use ankit ; 

create table table1(
col1 integer
); 

create table table2(
col2 integer 
)

select * from table1; 

insert into table1 values 
(1),
(1),
(1),
(2),
(3),
(3),
(3)

insert into table2 values 
(1),
(1),
(2),
(2),
(4); 


select * from 
table1 

select t1.*,t2.* from 
table1  t1
full outer join 
table2 t2 
on 
t1.col1 = t2.col2