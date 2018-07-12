SELECT
  col1,
  typeOf(col1) tOfcol1,
  col2,
  typeOf(col2) tOfcol2,
  col3,
  typeOf(col3) tOfcol3
FROM (
  SELECT
    1 AS col1,
    CAST(2.0 AS DECIMAL(9,2)) AS col2,
    CAST(3.0 AS DECIMAL(9,2)) AS col3
    FROM
      dfs.drillTestDir.`decimal/DRILL_6094/decimal9.csv`
    limit 1
) d;
