-- expected: hand-computed. a={2.5,3.5,5.5,7.5,10.5}->5.5; b={1,2,3,4}->2.5; d={2.0,6.0} (NULL ignored)->4.0
select g, median(d) m from `drill-1.22-delta/median/nums.json` where g in ('a','b','d') group by g
