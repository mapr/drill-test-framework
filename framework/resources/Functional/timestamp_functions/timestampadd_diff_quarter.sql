SELECT
  TIMESTAMPDIFF(SQL_TSI_QUARTER, CAST(TIMESTAMPADD(SQL_TSI_QUARTER, -8, o_orderdate) AS DATE), o_orderdate) AS num_of_quarters
FROM
  orders
WHERE
  o_orderkey = 1;