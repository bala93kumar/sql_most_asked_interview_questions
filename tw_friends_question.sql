use ankit; 

drop table friendship 

Create table If Not Exists Friendship 
(user1_id int, user2_id int);


insert into Friendship (user1_id, user2_id) values 
('1', '2')
,('1', '3')
,('2', '3')
,('1', '4')
,('2', '4')
,('1', '5')
,('2', '5')
, ('1', '7')
, ('3', '7')
, ('1', '6')
, ('3', '6')
,('2', '6');

select * from  Friendship; 

with cte as
( 
select * from friendship 
union all 
select user2_id as user1_id , user1_id as user2_id  from friendship 
)
##select * from cte

 
select  c1.user1_id , c2.user1_id , count(1) from cte c1
join cte c2 
on  (c1.user1_id < c2.user1_id ) and (c1.user2_id = c2.user2_id)
 group by  c1.user1_id, c2.user1_id
having count(1) > 2

group by c1.user_
 
