select tinyint_var, avg(length(str_var)), count(*) from widestrings group by tinyint_var;
