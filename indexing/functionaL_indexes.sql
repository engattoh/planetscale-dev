/*
drop table people;
create table people(
                       id bigint unsigned not null auto_increment,
                       first_name varchar(100) not null ,
                       last_name varchar(100) not null ,
                       state char(3) not null ,
                       email varchar(64) not null ,
                       birthday date not null,

                       primary key (id)
);
 */

--  drop indexes for this use case
--  alter table people drop index multi;

show indexes from people;
alter table people add index(birthday);
alter table people add index idx_month_birth ( ( month(birthday)));

explain
select
    id
from people
where month(birthday)  = 2;
# where  birthday = '1987-01-01';

