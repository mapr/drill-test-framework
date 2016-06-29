select c_varchar, COUNT(DISTINCT c_integer) from alltypes_v group by c_varchar order by c_varchar, COUNT(DISTINCT c_integer) desc;
