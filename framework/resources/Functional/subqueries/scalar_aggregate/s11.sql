-- Non correlated
-- Less than
-- MIN returns NULL
select * from j2 where c_float < (select min(c_float) from j6 where c_boolean is null );
