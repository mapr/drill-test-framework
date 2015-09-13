select gender2.gender as c0 from (SELECT * FROM customer) as gender2 group by gender2.gender order by gender2.gender ASC NULLS LAST;
