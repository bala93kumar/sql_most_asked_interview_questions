Create table If Not Exists Enrollments 
(student_id int, 
course_id int, 
grade int
);

drop table enrollments ; 

insert into Enrollments (student_id, course_id, grade) values ('2', '2', '95') ,
('2', '3', '95'),
('1', '1', '90'),
('1', '2', '99'),
('3', '1', '80'),
('3', '2', '75'),
('3', '3', '82');

select * from  enrollments; 

select  student_id , course_id , max(grade) 
from enrollments
group by grade 
order by student_id 

select student_id , course_id ,grade ,  dense_rank() over(partition by student_id order by grade desc , course_id asc   ) as ranks
from enrollments