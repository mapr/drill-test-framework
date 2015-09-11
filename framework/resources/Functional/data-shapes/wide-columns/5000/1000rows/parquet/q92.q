select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var, dec_var_prec5_sc2 from widestrings where str_var_null_empty like '%Abc%';
