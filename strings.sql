drop table strings;
create table strings (
                         var100 varchar(100)
);

show create table strings;

select * from information_schema.CHARACTER_SETS order by CHARACTER_SET_NAME desc ;


-- useful for hashes smaller representations for hash
-- select * from bins where bin = unhex(input);
drop table bins ;
create table bins (

    bin binary(16) ,
    var varbinary(100)
);

insert into bins values (unhex(md5('jonathan')) , unhex(md5('jonathan')));
select unhex( md5('jonathan')) , md5('jonathan');


-- enums

drop table orders;
create table orders (
    id serial,
    size enum ('x-small', 'small', 'medium', 'large' , 'x-large')
);

insert into orders(size)
values
    ('small'),
    ('large') ,
    ('medium');

select * from orders;