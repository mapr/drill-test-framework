select str_empty, sum(tinyint_var) from widestrings  where length(str_empty) > 0 and length(str_var) < 4010  group by str_empty;
