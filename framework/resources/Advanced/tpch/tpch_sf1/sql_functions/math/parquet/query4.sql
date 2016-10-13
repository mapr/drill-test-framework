select floor(abs(max(L_DISCOUNT) - L_LINENUMBER)) from lineitem group by L_LINENUMBER order by L_LINENUMBER limit 5;
