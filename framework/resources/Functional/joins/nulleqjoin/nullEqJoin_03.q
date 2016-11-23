-- Test support for mixed comparators.

WITH test_CTE_1 (c1, c2, c4, c5)
AS
(
    SELECT t1.c1, t1.c2, t1.c4, t1.c5
    FROM `t_alltype.parquet` t1
),
test_CTE_2 (c1, c2, c4, c5)
AS
(
    SELECT t2.c1, t2.c2, t2.c4, t2.c5
    FROM `t_alltype.parquet` t2
   
)
SELECT * from test_CTE_1 cte1, test_CTE_1 cte2
WHERE  cte1.c1 = cte2.c1 AND (cte1.c5 = cte2.c5 OR (cte1.c5 IS NULL AND cte2.c5 IS NULL));
