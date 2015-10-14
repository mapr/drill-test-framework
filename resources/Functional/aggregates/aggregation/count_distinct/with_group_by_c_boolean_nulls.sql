select c_boolean, COUNT(DISTINCT c_integer) from alltypes_with_nulls group by c_boolean order by c_boolean;
