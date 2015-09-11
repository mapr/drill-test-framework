-- Correlated
-- Inequality
-- Expression
select count(*) from j6 where c_bigint <> (select sum(c_integer)*1.05 from j7 where j6.c_boolean = j7.c_boolean);
