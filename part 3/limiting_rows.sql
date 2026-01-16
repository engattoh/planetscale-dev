
-- uses the smallest secondary index
select count(*) from film;


-- returns the number of non-null film_ids
select count(film_id) from film;