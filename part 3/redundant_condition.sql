

-- example say we have a todos table and have an index on the duedate field
show tables;

create table todos (
    id int unsigned ,
    due_date date not null ,
    due_time time not null ,

    primary key (id),
    index(due_date)
)


-- find todos due in the next 24 hours

select *
from todos
where addtime(due_date, due_time) between now() and now() + interval  1 day;

-- this query obfuscates the index on due_date
-- we can use a redundant condition to unlock indexes

select * from todos
where addtime(due_date, due_time) between now() and now() + interval 1 day
and due_date between current_date and current_date + interval 1 day;

-- this query adds a redudant condition that does not obfuscate the index


/*

Using the approximate condition helps to narrow down the result set even though it may include a few false positives.
After narrowing down the result set, you can then use the expensive filtering,
which is not indexable, to remove the false positives and get the correct result set.

 */