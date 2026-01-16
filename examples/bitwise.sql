

show tables;
describe users;

select * from users;


alter table users add column flags tinyint unsigned default 0;

describe users;

show create table users;

select * from users where flags & 1 = 1;