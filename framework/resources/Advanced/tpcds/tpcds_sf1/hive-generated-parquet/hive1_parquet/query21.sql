-- start query 21 in stream 0 using template query21.tpl 
SELECT
         * 
FROM    ( 
                  SELECT   w.w_warehouse_name , 
                           i.i_item_id , 
                           Sum( 
                           CASE 
                                    WHEN ( 
                                                      Cast(dd.d_date AS DATE) < Cast ('2000-05-13' AS DATE)) THEN inv.inv_quantity_on_hand 
                                    ELSE 0 
                           END) AS inv_before , 
                           Sum( 
                           CASE 
                                    WHEN ( 
                                                      Cast(dd.d_date AS DATE) >= Cast ('2000-05-13' AS DATE)) THEN inv.inv_quantity_on_hand 
                                    ELSE 0 
                           END) AS inv_after 
                  FROM     inventory inv, 
                           warehouse w, 
                           item i, 
                           date_dim dd 
                  WHERE    i.i_current_price BETWEEN 0.99 AND      1.49 
                  AND      i.i_item_sk = inv.inv_item_sk 
                  AND      inv.inv_warehouse_sk = w.w_warehouse_sk 
                  AND      inv.inv_date_sk = dd.d_date_sk 
                  AND      dd.d_date BETWEEN (Cast ('2000-05-13' AS DATE) - INTERVAL '30' day) AND      ( 
                                    cast ('2000-05-13' AS        date) + INTERVAL '30' day) 
                  GROUP BY w.w_warehouse_name, 
                           i.i_item_id) x 
WHERE    ( 
                  CASE 
                           WHEN inv_before > 0 THEN inv_after / inv_before 
                           ELSE NULL 
                  END) BETWEEN 2.0/3.0 AND      3.0/2.0 
ORDER BY w_warehouse_name , 
         i_item_id 
LIMIT 100; 

