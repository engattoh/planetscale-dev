 -- payment greater than the last 6 months
 -- run the subquery once and may be optimized by adding indexes

 with spend_last_6 as (select customer.customer_id, sum(amount) as spend
                       from customer
                                inner join payment
                                           on customer.customer_id = payment.customer_id
                       where store_id = 1
                         and payment_date > current_date - interval 6 month
                       group by customer.customer_id)




 select * from spend_last_6 where spend > ( select avg(spend) from spend_last_6) order by spend desc ;