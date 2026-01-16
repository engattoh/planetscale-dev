
create table parent(
    id bigint unsigned auto_increment,

    primary key(id)
);

create table child(
    id bigint unsigned auto_increment,
    parent_id bigint unsigned,

    foreign key (parent_id) references parent(id) on delete set null on update cascade,

    primary key (id)
);