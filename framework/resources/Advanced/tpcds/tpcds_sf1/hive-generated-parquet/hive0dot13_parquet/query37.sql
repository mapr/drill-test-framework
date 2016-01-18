-- start query 37 in stream 0 using template query37.tpl 
SELECT 
         i.i_item_id , 
         i.i_item_desc , 
         i.i_current_price 
FROM     item i, 
         inventory inv, 
         date_dim d, 
         catalog_sales cs 
WHERE    i.i_current_price BETWEEN 20 AND      20 + 30 
AND      inv.inv_item_sk = i.i_item_sk 
AND      d.d_date_sk=inv.inv_date_sk 
AND      d.d_date BETWEEN Cast('1999-03-06' AS DATE) AND      ( 
                  Cast('1999-03-06' AS DATE) + INTERVAL '60' day) 
AND      i.i_manufact_id IN (843,815,850,840) 
AND      inv.inv_quantity_on_hand BETWEEN 100 AND      500 
AND      cs.cs_item_sk = i.i_item_sk 
GROUP BY i.i_item_id, 
         i.i_item_desc, 
         i.i_current_price 
ORDER BY i.i_item_id 
LIMIT 100; 

