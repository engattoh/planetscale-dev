


select * from staff;

select * from store;


select st.*, sf.* from store  st
join staff sf
on st.manager_staff_id  = sf.staff_id;


describe film;
describe actor;


select film.film_id, film.title, film.release_year, film.length, actor.actor_id,  actor.last_name, actor.first_name from film
left join film_actor on film.film_id  = film_actor.film_id
left  join actor on film_actor.actor_id = actor.actor_id
where film.film_id < 5 ;