-- /* q1 tpcds */
SELECT COUNT(DISTINCT c_customer_sk) as c_customer_sk
FROM customer
WHERE c_customer_sk IN
      (SELECT SS_CUSTOMER_SK FROM store_sales);
