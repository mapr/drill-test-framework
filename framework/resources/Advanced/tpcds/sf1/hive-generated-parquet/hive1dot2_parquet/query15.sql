-- start query 15 in stream 0 using template query15.tpl 
SELECT ca.ca_zip, 
       Sum(cs.cs_sales_price) 
FROM   catalog_sales cs, 
       customer c, 
       customer_address ca, 
       date_dim dd
WHERE  cs.cs_bill_customer_sk = c.c_customer_sk 
       AND c.c_current_addr_sk = ca.ca_address_sk 
       AND ( Substr(ca.ca_zip, 1, 5) IN ( '85669', '86197', '88274', '83405', 
                                       '86475', '85392', '85460', '80348', 
                                       '81792' ) 
              OR ca.ca_state IN ( 'CA', 'WA', 'GA' ) 
              OR cs.cs_sales_price > 500 ) 
       AND cs.cs_sold_date_sk = dd.d_date_sk 
       AND dd.d_qoy = 1 
       AND dd.d_year = 1998 
GROUP  BY ca.ca_zip 
ORDER  BY ca.ca_zip
LIMIT 100; 
