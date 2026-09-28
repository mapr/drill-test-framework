-- expected: hand-computed, {1,2,3,4} as DOUBLE -> 2.5
select median(x) m from (values(cast(1 as double)),(cast(2 as double)),(cast(3 as double)),(cast(4 as double))) t(x)
