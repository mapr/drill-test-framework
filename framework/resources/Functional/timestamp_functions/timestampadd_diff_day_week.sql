SELECT
  TIMESTAMPDIFF(SQL_TSI_WEEK, CAST(TIMESTAMPADD(SQL_TSI_DAY, -DAYOFMONTH(o_orderdate), o_orderdate) AS DATE), o_orderdate) AS week_diff
FROM
  orders
WHERE
  o_orderkey = 3;