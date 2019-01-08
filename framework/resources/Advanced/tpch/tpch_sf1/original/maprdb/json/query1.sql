SELECT
  L_RETURNFLAG,
  L_LINESTATUS,
  SUM(cast(L_QUANTITY as decimal(10,2))) AS SUM_QTY,
  SUM(cast(L_EXTENDEDPRICE as decimal(10,2))) AS SUM_BASE_PRICE,
  SUM(cast(L_EXTENDEDPRICE as decimal(10,2)) * (1 - cast(L_DISCOUNT as decimal(10,2)))) AS SUM_DISC_PRICE,
  SUM(cast(L_EXTENDEDPRICE as decimal(10,2)) * (1 - cast(L_DISCOUNT as decimal(10,2))) * (1 + cast(L_TAX as decimal(10,2)))) AS SUM_CHARGE,
  AVG(cast(L_QUANTITY as decimal(10,2))) AS AVG_QTY,
  AVG(cast(L_EXTENDEDPRICE as decimal(10,2))) AS AVG_PRICE,
  AVG(cast(L_DISCOUNT as decimal(10,2))) AS AVG_DISC,
  COUNT(*) AS COUNT_ORDER 
FROM
 lineitem
WHERE
  L_SHIPDate <= CAST((DATE '1998-12-01' - INTERVAL '120' DAY (3)) AS DATE)
GROUP BY
  L_RETURNFLAG,
  L_LINESTATUS 
ORDER BY
  L_RETURNFLAG,
  L_LINESTATUS;
