

show tables;

show create table people;

show indexes from people;

explain format=tree   select * from people;
explain format=json   select * from people where first_name ='joe';


-- analyze actual runs the query
explain analyze select * from people;
explain analyze  format=json select * from people;
