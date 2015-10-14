-- Correlated
-- With expression
select * from j1 where c_integer > (select avg(c_integer)*100 from j2 where j1.c_date = j2.c_date);
