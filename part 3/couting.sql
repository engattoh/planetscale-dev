

select rental_date, dayofweek(rental.rental_date), dayname(rental_date)  from rental limit 4 ;

select
    count( if(dayofweek(rental_date) in (1, 7), 1, null)) as weekend_count,
    count( if(dayofweek(rental_date) not in (1, 7) , 1, null)) as weekday_count
from rental;


select sum( dayofweek(rental_date) in (1, 7)) as weekend_count ,
       sum(dayofweek(rental_date) not in (1,7)) as weekday_count
from rental;


select count( dayofweek(rental_date) in (1, 7)),
       count(dayofweek(rental_date) not in (1,7))
from rental;


select count(*) , count(rental_date) from rental;

