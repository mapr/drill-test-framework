alter session set `planner.enable_hashjoin` = false;
select ws1.* from widestrings ws1 INNER JOIN (select str_var_null_empty from widestrings where str_var_null_empty is not null and length(str_var_null_empty) <> 0 )ws2 on ws1.str_var=ws2.str_var_null_empty where ws1.str_var is not null and length(ws1.str_var) <> 0;
alter session set `planner.enable_hashjoin` = true;
