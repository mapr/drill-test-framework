alter session set `planner.enable_hashjoin` = false;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_var=ws2.str_var_null_empty;
alter session set `planner.enable_hashjoin` = true;
