-- expected: math. 100 -> 0 is -100.0 %. Change from 0 is undefined: NULL or Infinity are both acceptable (dev's choice), only 0.0 ("no change") is wrong.
select percent_change(100, 0) a, case when percent_change(0, 100) = 0.0 then 'zero' else 'not_zero' end b from (values(1))
