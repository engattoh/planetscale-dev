
drop table emails;

create table emails(
    email varchar(255),
    domain varchar(100) as ( substring_index(email, '@', -1)),
    json json ,
    location varchar(100) as (json ->> "$.location") stored
);


show create table emails;

insert into emails(email, json)
values ('attoh.kweku@gmail.com', '{"location": "Kasoa"}'),
       ('jonathana.heatmap@gmail.com', '{"location": "Amasaaman"}'),
       ('attoh.attram@gmail.com', '{ "location": "Accra"}');

select email, location from emails;