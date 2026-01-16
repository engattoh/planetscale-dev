

-- use named windows
-- help mysql process chunk or partition only once

select customer_id,
       row_number() over (w_asc) as num ,
       first_value(rental_id) over (w_asc) as first_rental,
       first_value(rental_id) over(w_desc) as last_rental,
       sum(amount) over (w_asc) as running_total,
       lag(rental_id) over(w_asc) as prev_rental ,
       lead(rental_id) over (w_asc) as next_rental
from payment
window
    w_asc as ( partition by customer_id order by payment_date asc),
    w_desc as ( partition by customer_id order by payment_date desc)
order by customer_id, num