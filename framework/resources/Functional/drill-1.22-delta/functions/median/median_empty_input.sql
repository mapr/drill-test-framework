-- expected: SQL semantics, aggregate over zero rows -> NULL
select median(i) m from `drill-1.22-delta/median/nums.json` where g = 'no_such_group'
