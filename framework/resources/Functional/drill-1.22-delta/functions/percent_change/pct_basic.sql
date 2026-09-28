-- expected: (new-old)*100/old -> 100->150 = 50.0, 200->100 = -50.0 (same as upstream TestDistributionFunctions)
select percent_change(100, 150) a, percent_change(200, 100) b, percent_Change(10, 15) c from (values(1))
