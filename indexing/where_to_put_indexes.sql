
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

show create table people;

alter table people add index multi(first_name, last_name, birthday);

show indexes from people;
-- prefix index
alter table people add index (first_name(6));

show indexes from people;



-- covering index
explain
select
    first_name, last_name
from
    people
where
    first_name = 'Michael'
    and last_name = 'Doe';

-- cardinality, selectivity
-- prefix indexes

select
    count(distinct first_name) / count(*) ,
    count( distinct left(first_name, 4)) / count(*) as left4,
    count( distinct left(first_name, 5)) / count(*) as left5,
    count( distinct left(first_name, 6)) / count(*) as left6,
    count( distinct left(first_name, 7)) / count(*) as left7
from people;



show indexes from people;

select * from people;

show indexes from people;

-- dummy data
INSERT INTO people (first_name, last_name, state, email, birthday)
VALUES
    ('John', 'Doe', 'CA', 'johndoe@example.com', '1985-05-15'),
    ('Jane', 'Smith', 'TX', 'janesmith@example.com', '1990-09-22'),
    ('Michael', 'Johnson', 'NY', 'michael.johnson@example.com', '1982-11-30'),
    ('Emily', 'Davis', 'FL', 'emily.davis@example.com', '1995-03-10'),
    ('Chris', 'Brown', 'WA', 'chris.brown@example.com', '1987-12-02'),
    ('Sarah', 'Wilson', 'NV', 'sarah.wilson@example.com', '1993-01-18'),
    ('David', 'Taylor', 'AZ', 'david.taylor@example.com', '1980-07-07'),
    ('Olivia', 'Moore', 'OR', 'olivia.moore@example.com', '1992-08-25'),
    ('Daniel', 'Anderson', 'CO', 'daniel.anderson@example.com', '1986-04-12'),
    ('Sophia', 'Thomas', 'UT', 'sophia.thomas@example.com', '1997-06-29');


