
insert into payment_summary(amount, year, month)
select
    sum(amount),
    year(payment_date) as year,
    month(payment_date) as month
from payment
where payment_date < date_format(current_date, '%Y-%m-01')
group by year, month;


create table payment_summary(
    id bigint unsigned auto_increment not null ,
    amount decimal(9,2),
    year year ,
    month tinyint unsigned,

    primary key (id)
);


with payment_data as (select amount, `year`, `month`
                              from payment_summary
                              union all
                              select sum(amount), year(payment_date) as `year`, month(payment_date) as `month`
                              from payment
                              where payment_date > date_format(current_date, '%Y-%m-01')
                              group by `year`, `month`)

select * from payment_data;