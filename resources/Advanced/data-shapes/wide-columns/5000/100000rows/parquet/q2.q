select str_var, sum(tinyint_var) from widestrings  where length(str_empty) > 0 and dec_var_prec5_sc2 < -100 group by str_var;
