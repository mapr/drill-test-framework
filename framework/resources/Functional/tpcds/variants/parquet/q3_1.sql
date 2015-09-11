--/* q3 tpcds */

SELECT SS_STORE_SK AS STORE_ID,
       COUNT(DISTINCT SS_CUSTOMER_SK) AS CustomerCount
FROM store_sales
WHERE SS_HDEMO_SK IN
      (SELECT HD_DEMO_SK
       FROM household_demographics
       WHERE hd_dep_count > 3
          AND hd_income_band_sk in ( 1, 3, 5, 7, 9, 11))
GROUP BY SS_STORE_SK;
