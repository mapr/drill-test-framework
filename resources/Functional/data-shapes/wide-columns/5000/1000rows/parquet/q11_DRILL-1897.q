select tinyint_var, avg(length(str_null)), count(*) from widestrings group by tinyint_var;
