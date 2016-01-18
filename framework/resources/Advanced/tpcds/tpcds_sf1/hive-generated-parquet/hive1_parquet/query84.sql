-- start query 84 in stream 0 using template query84.tpl 
SELECT c.c_customer_id   AS customer_id, 
               c.c_last_name 
               || ', ' 
               || c.c_first_name AS customername 
FROM   customer c, 
       customer_address ca, 
       customer_demographics cd, 
       household_demographics hd, 
       income_band ib, 
       store_returns sr
WHERE  ca.ca_city = 'Green Acres' 
       AND c.c_current_addr_sk = ca.ca_address_sk 
       AND ib.ib_lower_bound >= 54986 
       AND ib.ib_upper_bound <= 54986 + 50000 
       AND ib.ib_income_band_sk = hd.hd_income_band_sk 
       AND cd.cd_demo_sk = c.c_current_cdemo_sk 
       AND hd.hd_demo_sk = c.c_current_hdemo_sk 
       AND sr.sr_cdemo_sk = cd.cd_demo_sk 
ORDER  BY c.c_customer_id
LIMIT 100; 
