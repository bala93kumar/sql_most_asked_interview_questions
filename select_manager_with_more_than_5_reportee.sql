

Create table If Not Exists Employee (
Id int, 
Name varchar(255), 
Department varchar(255), 
ManagerId int
);

insert into Employee(Id, Name, Department, ManagerId) values 
('101', 'John', 'A', Null),
('102', 'Dan', 'A', '101'), 
('103', 'James', 'A', '101'), 
('104', 'Amy', 'A', '101'),
('105', 'Anne', 'A', '101'),
('106', 'Ron', 'B', '101'),
('107', 'Tony', 'C', '103'),
('108', 'Rocky', 'C', '103');

with cte as 
(
select a.managerId, b.name  from 
employee a 
inner join 
employee b 
on a.managerId = b.id
)
select name , count(1) from 
cte 
group by name
having count(1) >= 5




