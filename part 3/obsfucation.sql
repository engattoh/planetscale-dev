show tables;

select * from actor;


select count(*) from film;

describe film;

show indexes from film;

alter table film add index(length);


-- this obsfucates the length index
explain select * from film
where length / 60 < 2 ;


-- do this instead

explain select * from film
where length < 120;


show indexes from film;