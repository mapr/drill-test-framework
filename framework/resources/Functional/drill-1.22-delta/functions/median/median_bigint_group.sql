-- expected: hand-computed. a={2,3,5,7,10}->5; b={1,2,3,4}->(2+3)/2=2 (BIGINT output, integer division by design, AggrTypes4.tdd); d={4,8} (NULL ignored)->6
select g, median(i) m from `drill-1.22-delta/median/nums.json` where g in ('a','b','d') group by g
