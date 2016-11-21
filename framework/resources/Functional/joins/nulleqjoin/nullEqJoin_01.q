WITH test_CTE (c1, c2, c4, c5)
AS
(
    SELECT t1.c1, t1.c2, t1.c4, t1.c5
    FROM `t_alltype.parquet` t1, `t_alltype.parquet` t2
    WHERE t1.c4 = t2.c4 OR (t1.c4 IS NULL AND t2.c4 IS NULL)
)
SELECT c1, c2, c4, count(c5)
FROM test_CTE
GROUP BY c1,c2,c4,c5
order by c1;
