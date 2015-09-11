--/*4.9 mins*/
--/*q7 tpcds equivalent*/
SELECT
    ss_quantity ,
    COUNT( DISTINCT ss_store_sk) AS accounts ,
    SUM(wholesale) AS sum_wholesale ,
    SUM(listprice) AS sum_listprice ,
    SUM(_salesprice) AS sum_salesprice
FROM
    (
        SELECT
            ss_quantity ,
            ss_store_sk,
      sum(case when s.ss_quantity between 1 AND 20 then s.ss_wholesale_cost else 0 end) as wholesale,
        sum(case when s.ss_quantity between 21 AND 40 then s.ss_list_price else 0 end) as  listprice,
        sum(case when s.ss_quantity BETWEEN 41 AND 60 then s.ss_sales_price else 0 end) as _salesprice,
        sum(case when s.ss_quantity BETWEEN 61 AND 81 then s.ss_net_paid else 0 end) as  _netpaid
        FROM
            store_sales s
        WHERE
            ss_store_sk IN(
                SELECT
                    s_store_sk
                FROM
                    store
                WHERE
                    s_market_id IN( 2, 4, 6, 7, 8)
                    and s_store_sk not in (3)
            )
            AND s.ss_quantity between 1 AND 99
            AND (ss_item_sk, ss_ticket_number)
                IN(
                SELECT
                 ss_item_sk, ss_ticket_number
            FROM
                    store_sales
                WHERE
                    ss_store_sk IN(1, 2, 5, 6, 7, 8) /*PW*/
                    AND ss_quantity between 1 AND 99
                    AND ss_promo_sk IN( 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110)
            )
            AND s.ss_promo_sk IN( 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110)
        GROUP BY
            	ss_quantity,
		        ss_store_sk
    ) dat
GROUP BY  	ss_quantity
ORDER BY 	ss_quantity;
