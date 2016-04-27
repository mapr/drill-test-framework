-- Test to verify fix for DRILL-3854.
select convert_from(sal, 'int_be') from tbl_int_be order by sal;
