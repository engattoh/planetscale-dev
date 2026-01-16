

create table imports (
    id bigint  not null auto_increment,
    filename varchar(255),
    owner int default 0 ,
    available tinyint default 1,
    started_at timestamp,
    finished_at timestamp,
    primary key (id) ,
    index available_owner(available, owner)
);


-- not recommend (select row and issue a claim after )

select *
from imports
where available = 1
limit 1;

-- recommended (issue claim and select )
update imports
set owner = '?' , available = 0
where owner = 0 and available =1 ;


select * from imports where owner = '?' limit 1 ;