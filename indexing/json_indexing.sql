
drop table json_data;

create table json_data (
    id bigint unsigned not null auto_increment,
    name varchar(255) not null ,
    json json not null ,

    primary key (id)
);

-- create index on email

alter table json_data add column email varchar(255) generated always as ( json ->> '$.email');
alter table json_data add index(email);

show indexes from json_data;


explain
select
    name, email
from json_data
where json ->> '$.email' = 'johndoe@example.com';

select name, json ->> '$.email' as email from json_data;

-- or using functional indexes

alter table json_data add index (( cast ( json ->> '$.email' as CHAR(255)) collate  utf8mb4_bin));

select
    collation(cast( json ->> '$.email' as CHAR(255))),
    collation( json ->> '$.email')
from json_data;



/*
INSERT INTO json_data (name, json) VALUES
                                       ('John Doe', '{"email": "johndoe@example.com", "words": ["hello", "world"], "age": 30, "address": "123 Elm Street", "isActive": true}'),
                                       ('Jane Smith', '{"email": "janesmith@example.com", "words": ["example", "test"], "age": 25, "address": "456 Oak Avenue", "isActive": true}'),
                                       ('Sam Brown', '{"email": "sambrown@example.com", "words": ["code", "programming"], "age": 28, "address": "789 Pine Road", "isActive": false}'),
                                       ('Alice Johnson', '{"email": "alicej@example.com", "words": ["data", "analysis"], "age": 35, "address": "321 Maple Drive", "isActive": true}'),
                                       ('Bob Lee', '{"email": "boblee@example.com", "words": ["design", "interface"], "age": 40, "address": "654 Cedar Lane", "isActive": false}'),
                                       ('Charlie Green', '{"email": "charlieg@example.com", "words": ["javascript", "frontend"], "age": 22, "address": "987 Birch Boulevard", "isActive": true}'),
                                       ('Diana Walker', '{"email": "dianaw@example.com", "words": ["python", "backend"], "age": 27, "address": "123 Birch Court", "isActive": true}'),
                                       ('Edward King', '{"email": "edwardk@example.com", "words": ["html", "css"], "age": 33, "address": "456 Pine Hill", "isActive": false}'),
                                       ('Fiona Scott', '{"email": "fionas@example.com", "words": ["database", "query"], "age": 29, "address": "321 Oak Park", "isActive": true}'),
                                       ('George Adams', '{"email": "georgea@example.com", "words": ["algorithm", "optimization"], "age": 34, "address": "654 Cedar Road", "isActive": true}'),
                                       ('Hannah Martin', '{"email": "hannahm@example.com", "words": ["cloud", "deployment"], "age": 24, "address": "987 Maple Court", "isActive": true}'),
                                       ('Ivy Thomas', '{"email": "ivyt@example.com", "words": ["security", "encryption"], "age": 31, "address": "123 Pine Road", "isActive": false}'),
                                       ('Jack Garcia', '{"email": "jackg@example.com", "words": ["app", "mobile"], "age": 26, "address": "456 Birch Drive", "isActive": true}'),
                                       ('Kathy Martinez', '{"email": "kathym@example.com", "words": ["machine learning", "ai"], "age": 32, "address": "789 Oak Street", "isActive": false}'),
                                       ('Liam Wilson', '{"email": "liamw@example.com", "words": ["game", "development"], "age": 28, "address": "321 Pine Avenue", "isActive": true}'),
                                       ('Mona Perez', '{"email": "monap@example.com", "words": ["network", "infrastructure"], "age": 38, "address": "654 Maple Park", "isActive": true}'),
                                       ('Noah Harris', '{"email": "noahh@example.com", "words": ["testing", "automation"], "age": 27, "address": "987 Cedar Road", "isActive": false}'),
                                       ('Olivia Martinez', '{"email": "oliviam@example.com", "words": ["blockchain", "crypto"], "age": 23, "address": "123 Oak Hill", "isActive": true}'),
                                       ('Paul Robinson', '{"email": "paulr@example.com", "words": ["virtualization", "cloud"], "age": 41, "address": "456 Maple Lane", "isActive": true}'),
                                       ('Quinn Mitchell', '{"email": "quinnm@example.com", "words": ["react", "redux"], "age": 29, "address": "789 Pine Street", "isActive": true}');


 */