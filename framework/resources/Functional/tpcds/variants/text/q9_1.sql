-- /*7.4 mins*/
-- /*q9 tpcds equivalent*/
SELECT
    c.c_customer_sk,
    rtrim(c.c_first_name) as c_first_name,
    rtrim(c.c_last_name) as c_last_name,
    SQ.Quant,
    SQ.Coupon
FROM
    (
        SELECT
            ss_customer_sk,
            SUM(ss_quantity)  AS Quant,
            SUM(ss_coupon_amt) AS Coupon
        FROM
            store_sales s
        WHERE
            ss_store_sk IN ( 1, 2, 5, 6, 7, 8 )
        AND ss_customer_sk IN
            (
                SELECT
                    c_customer_sk
                FROM customer
                WHERE
                    c_birth_month IN ( 3, 5)
            )
        AND (ss_item_sk, ss_ticket_number ) IN
            (
                SELECT ss_item_sk, ss_ticket_number
                FROM
                    store_sales
                WHERE
                    ss_promo_sk >= 50
                AND ss_store_sk IN(1, 2, 5, 6, 7, 8)
            )
        AND ss_promo_sk >= 50
        GROUP BY
            ss_customer_sk
        ORDER BY
            3 DESC limit 100 ) SQ
LEFT JOIN
    customer c
ON
    SQ.ss_customer_sk = c.c_customer_sk
WHERE
    c.c_birth_month IN ( 3, 5)
ORDER BY 4 DESC ;
