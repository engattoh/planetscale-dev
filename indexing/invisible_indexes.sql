

show create table people;


-- make birthday indexes invisible
alter table people alter index birthday invisible ;

-- make birthday index visible again
alter table people alter index birthday visible ;

show indexes from people;