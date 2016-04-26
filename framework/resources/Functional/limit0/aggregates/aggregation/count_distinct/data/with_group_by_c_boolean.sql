select c_boolean, COUNT(DISTINCT c_integer) from alltypes_v group by c_boolean order by c_boolean;
