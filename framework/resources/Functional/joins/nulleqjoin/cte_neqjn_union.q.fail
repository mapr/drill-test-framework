WITH t_left AS
(
    SELECT  col_int from typeall_l  where col_int IS NOT NULL
        UNION ALL
    SELECT  col_int from typeall_l where col_int IS NULL
),
t_right AS
(
    SELECT col_int from typeall_r  where col_int IS NOT NULL 
        UNION ALL
    SELECT col_int from typeall_r where col_int IS NULL 
)
SELECT  l.*
FROM    t_left l
WHERE   NOT EXISTS
(
    SELECT  *
    FROM    t_right r
    WHERE   r.col_int = l.col_int OR (l.col_int IS NULL AND r.col_int IS NULL)
);
