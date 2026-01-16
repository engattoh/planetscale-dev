
-- a cte that references itself

with recursive all_dates as (
    select '2005-01-01' as dt
    union all
    select dt + interval 1 day from all_dates where dt < '2005-12-31'
    )



select dt, sum(amount)
from all_dates
left join payment on all_dates.dt  = date_format(payment_date,'%Y-%m-%d')
group by dt
having sum(amount) is not null



select * from category;
select * from film_category;

with recursive all_categories (
    select id,  name , 0 as depth from categories where parent_id is null
    union all
    select categories.id , categories.name , depth + 1 from all_categories inner join categories
    on all_categories.id  = categories.parent_id
    );