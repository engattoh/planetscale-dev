

drop table has_json;
create table has_json (
    json json
);

insert into has_json
values ('{"name": "Jonathan"}');

select * from has_json;