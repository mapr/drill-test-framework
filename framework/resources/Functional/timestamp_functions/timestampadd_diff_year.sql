SELECT
  TIMESTAMPDIFF(SQL_TSI_YEAR, CAST(TIMESTAMPADD(SQL_TSI_YEAR, 8, o_orderdate) AS DATE), o_orderdate) AS num_of_years
FROM
  orders
WHERE
  o_orderkey = 1;