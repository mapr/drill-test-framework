SELECT res, (CASE res WHEN 1 THEN 2 ELSE null END) res1
FROM
(     
      SELECT
         (CASE WHEN (false) THEN null ELSE 1 END) res
     FROM (VALUES(1)) sbqry
) subquery;
