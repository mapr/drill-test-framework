select tinyint_var, avg(length(str_fixed)), count(*) from widestrings group by tinyint_var;
