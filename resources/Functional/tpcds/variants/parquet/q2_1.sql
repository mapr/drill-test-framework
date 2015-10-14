--/* q2 tpcds */

SELECT SS_STORE_SK, rtrim(P_PROMO_NAME) as promo_name,
  SUM(
      CASE
          WHEN P_PROMO_NAME in ('able')
          THEN 0
          ELSE 1
      END) as TestCustomers,
  SUM(
      CASE
          WHEN P_PROMO_NAME in ('pri', 'anti')
          THEN 1
          ELSE 0
      END) as ControlCustomers,
  P_COST * SUM(1) as ExpectedControlCustomers
FROM (
  SELECT S.SS_STORE_SK, OFFERS.P_PROMO_NAME, OFFERS.P_COST, OFFERS.P_RESPONSE_TARGET
  FROM store_sales S
  JOIN
       (SELECT DISTINCT p_promo_sk,
                        p_cost,
                        p_response_target,
                        p_promo_name
        FROM promotion
        WHERE p_response_target in (1)
         AND p_promo_name in ('able', 'pri', 'anti')
         AND LOWER(p_channel_tv) NOT LIKE ('%Y%')) OFFERS

       ON S.SS_PROMO_SK = OFFERS.P_PROMO_SK
       WHERE s.ss_store_sk IN (10, 2, 8, 7, 1)
  ) X
GROUP BY SS_STORE_SK, P_PROMO_NAME, P_COST, P_RESPONSE_TARGET
ORDER BY SS_STORE_SK, P_PROMO_NAME, P_COST, P_RESPONSE_TARGET;
