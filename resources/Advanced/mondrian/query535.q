select count(*) from (select distinct gender2.gender as c0 from (SELECT * FROM customer) as gender2) as init;
