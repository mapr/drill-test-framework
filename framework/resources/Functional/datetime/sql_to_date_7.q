select (res1 = sql_to_date('2016-09-22','yyyy-mm-dd')) res2 from (select (case when (false) then null else cast('2016/09/22' as date) end) res1 from (values(1)) foo) foobar;
