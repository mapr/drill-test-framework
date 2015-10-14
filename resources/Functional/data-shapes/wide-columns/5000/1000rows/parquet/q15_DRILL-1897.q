select tinyint_var, avg(length(str_fixed_null_empty)), count(*) from widestrings group by tinyint_var;
