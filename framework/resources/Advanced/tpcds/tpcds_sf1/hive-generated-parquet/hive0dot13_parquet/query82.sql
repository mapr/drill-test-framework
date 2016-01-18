
-- start query 82 in stream 0 using template query82.tpl 
SELECT
         i.i_item_id , 
         i.i_item_desc , 
         i.i_current_price 
FROM     item i, 
         inventory inv, 
         date_dim d, 
         store_sales ss 
WHERE    i.i_current_price BETWEEN 63 AND      63+30 
AND      inv.inv_item_sk = i.i_item_sk 
AND      d.d_date_sk=inv.inv_date_sk 
AND      d.d_date BETWEEN Cast('1998-04-27' AS DATE) AND      ( 
                  Cast('1998-04-27' AS DATE) + INTERVAL '60' day) 
AND      i.i_manufact_id IN (57,293,427,320) 
AND      inv.inv_quantity_on_hand BETWEEN 100 AND      500 
AND      ss.ss_item_sk = i.i_item_sk 
GROUP BY i.i_item_id, 
         i.i_item_desc, 
         i.i_current_price 
ORDER BY i.i_item_id 
LIMIT 100; 

