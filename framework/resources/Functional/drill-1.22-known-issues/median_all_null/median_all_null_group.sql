-- expected: SQL semantics, aggregate over only NULLs -> NULL (group c has i/d = NULL, NULL)
select g, median(i) mi, median(d) md from `drill-1.22-delta/median/nums.json` where g = 'c' group by g
