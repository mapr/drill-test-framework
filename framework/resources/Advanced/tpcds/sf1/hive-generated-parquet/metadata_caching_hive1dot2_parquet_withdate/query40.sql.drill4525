-- start query 40 in stream 0 using template query40.tpl 
SELECT
                w.w_state , 
                i.i_item_id , 
                Sum( 
                CASE 
                                WHEN ( 
                                                                Cast(d.d_date AS DATE) < Cast ('2002-06-01' AS DATE)) THEN cs.cs_sales_price - COALESCE(cr.cr_refunded_cash,0) 
                                ELSE 0 
                END) AS sales_before , 
                Sum( 
                CASE 
                                WHEN ( 
                                                                Cast(d.d_date AS DATE) >= Cast ('2002-06-01' AS DATE)) THEN cs.cs_sales_price - COALESCE(cr.cr_refunded_cash,0) 
                                ELSE 0 
                END) AS sales_after 
FROM            catalog_sales cs 
LEFT OUTER JOIN catalog_returns cr
ON              ( 
                                cs.cs_order_number = cr.cr_order_number 
                AND             cs.cs_item_sk = cr.cr_item_sk) , 
                warehouse w, 
                item i, 
                date_dim d
WHERE           i.i_current_price BETWEEN 0.99 AND             1.49 
AND             i.i_item_sk = cs.cs_item_sk 
AND             cs.cs_warehouse_sk = w.w_warehouse_sk 
AND             cs.cs_sold_date_sk = d.d_date_sk 
AND             d.d_date BETWEEN (Cast ('2002-06-01' AS DATE) - INTERVAL '30' day) AND             ( 
                                cast ('2002-06-01' AS date) + INTERVAL '30' day) 
GROUP BY        w.w_state, 
                i.i_item_id 
ORDER BY        w.w_state, 
                i.i_item_id 
LIMIT 100; 

