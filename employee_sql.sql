use ankit; 

create table emp_manager(emp_id int,emp_name varchar(50),salary int(20),manager_id int(10));
insert into emp_manager values(	1	,'Ankit',	10000	,4	);
insert into emp_manager values(	2	,'Mohit',	15000	,5	);
insert into emp_manager values(	3	,'Vikas',	10000	,4	);
insert into emp_manager values(	4	,'Rohit',	5000	,2	);
insert into emp_manager values(	5	,'Mudit',	12000	,6	);
insert into emp_manager values(	6	,'Agam',	12000	,2	);
insert into emp_manager values(	7	,'Sanjay',	9000	,2	);
insert into emp_manager values(	8	,'Ashish',	5000	,2	);

select * from emp_manager; 

select  emp_id 
from 
(
select a.* , b.salary as manager_salary  
from emp_manager a 
left join emp_manager b 
on a.manager_id  = b.emp_id 
) c 
where salary  > manager_salary   

