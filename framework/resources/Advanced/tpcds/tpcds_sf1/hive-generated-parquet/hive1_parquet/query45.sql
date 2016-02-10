-- start query 45 in stream 0 using template query45.tpl 
SELECT ca.ca_zip, 
               ca.ca_state, 
               Sum(ws.ws_sales_price) 
FROM   web_sales ws, 
       customer c, 
       customer_address ca, 
       date_dim d, 
       item i
WHERE  ws.ws_bill_customer_sk = c.c_customer_sk 
       AND c.c_current_addr_sk = ca.ca_address_sk 
       AND ws.ws_item_sk = i.i_item_sk 
       AND ( Substr(ca.ca_zip, 1, 5) IN ( '85669', '86197', '88274', '83405', 
                                       '86475', '85392', '85460', '80348', 
                                       '81792' ) 
              OR i.i_item_id IN (SELECT i.i_item_id 
                               FROM   item i
                               WHERE  i.i_item_sk IN ( 2, 3, 5, 7, 
                                                     11, 13, 17, 19, 
                                                     23, 29 )) ) 
       AND ws.ws_sold_date_sk = d.d_date_sk 
       AND d.d_qoy = 1 
       AND d.d_year = 2000 
GROUP  BY ca.ca_zip, 
          ca.ca_state 
ORDER  BY ca.ca_zip, 
          ca.ca_state
LIMIT 100; 
