

select * from payment;

-- comes with a lot of duplicate entries
select customer.* from customer
inner join payment on customer.customer_id = payment.customer_id



-- subquery
select first_name, last_name from customer
where customer.customer_id in ( select customer_id from payment where amount > 7);


-- correlated subquery ( semi-join pattern)
select first_name, last_name from customer
where exists ( select * from payment where payment.customer_id = customer.customer_id);

-- correlated subquery (anti-join pattern)
select first_name, last_name from customer
where not exists ( select * from payment where payment.customer_id  = customer.customer_id);