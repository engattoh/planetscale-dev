

create table if not exists posts_v0(

    title varchar(125) not null ,

    is_archived boolean

);


-- vs

create table if not exists posts(
    title varchar(125) not null ,

    archived_at timestamp
);

