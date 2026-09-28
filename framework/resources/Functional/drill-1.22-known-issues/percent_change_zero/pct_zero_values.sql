-- expected: math. 100 -> 0 is -100.0 %; change from 0 is undefined -> NULL
select percent_change(100, 0) a, percent_change(0, 100) b from (values(1))
