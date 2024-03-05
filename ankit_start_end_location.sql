use ankit; 

CREATE TABLE travel_data (
 customer VARCHAR(10),
 start_loc VARCHAR(50),
 end_loc VARCHAR(50)
);

INSERT INTO travel_data (customer, start_loc, end_loc) VALUES
 ('c1', 'New York', 'Lima'),
 ('c1', 'London', 'New York'),
 ('c1', 'Lima', 'Sao Paulo'),
 ('c1', 'Sao Paulo', 'New Delhi'),
 ('c2', 'Mumbai', 'Hyderabad'),
 ('c2', 'Surat', 'Pune'),
 ('c2', 'Hyderabad', 'Surat'),
 ('c3', 'Kochi', 'Kurnool'),
 ('c3', 'Lucknow', 'Agra'),
 ('c3', 'Agra', 'Jaipur'),
 ('c3', 'Jaipur', 'Kochi');
 
 
 select * from travel_data
 
 
 
 # find start and end location of each flight 
 
 CREATE TABLE flights 
(
    cid VARCHAR(512),
    fid VARCHAR(512),
    origin VARCHAR(512),
    Destination VARCHAR(512)
);


INSERT INTO flights (cid, fid, origin, Destination) VALUES ('1', 'f1', 'Del', 'Hyd');
INSERT INTO flights (cid, fid, origin, Destination) VALUES ('1', 'f2', 'Hyd', 'Blr');
INSERT INTO flights (cid, fid, origin, Destination) VALUES ('2', 'f3', 'Mum', 'Agra');
INSERT INTO flights (cid, fid, origin, Destination) VALUES ('2', 'f4', 'Agra', 'Kol');


select  * from flights ; 

select o.cid , o.origin ,o.destination  , d.origin , d.destination  
from flights  o
join flights d 
on 
o.destination = d.origin 

