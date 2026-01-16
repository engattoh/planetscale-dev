
drop table persons;
create table persons (
    id bigint unsigned not null auto_increment,
    name varchar(100) ,

    primary key (id)
);


show create table persons;
show indexes from persons;

select * from persons;