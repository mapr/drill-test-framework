SELECT
  TIMESTAMPDIFF(SQL_TSI_MONTH, CAST(TIMESTAMPADD(SQL_TSI_MONTH, -15, o_orderdate) AS DATE), o_orderdate) AS num_of_months
FROM
  orders
WHERE
  o_orderkey = 1;