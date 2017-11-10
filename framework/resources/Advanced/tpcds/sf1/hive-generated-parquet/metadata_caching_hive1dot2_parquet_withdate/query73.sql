-- start query 73 in stream 0 using template query73.tpl 
SELECT c.c_last_name, 
       c.c_first_name, 
       c.c_salutation, 
       c.c_preferred_cust_flag, 
       dj.ss_ticket_number, 
       dj.cnt 
FROM   (SELECT store_sales.ss_ticket_number, 
               store_sales.ss_customer_sk, 
               Count(*) cnt 
        FROM   store_sales, 
               date_dim, 
               store, 
               household_demographics 
        WHERE  store_sales.ss_sold_date_sk = date_dim.d_date_sk 
               AND store_sales.ss_store_sk = store.s_store_sk 
               AND store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk 
               AND date_dim.d_dom BETWEEN 1 AND 2 
               AND ( household_demographics.hd_buy_potential = '>10000' 
                      OR household_demographics.hd_buy_potential = '0-500' ) 
               AND household_demographics.hd_vehicle_count > 0 
               AND CASE 
                     WHEN household_demographics.hd_vehicle_count > 0 THEN 
                     household_demographics.hd_dep_count / 
                     household_demographics.hd_vehicle_count 
                     ELSE NULL 
                   END > 1 
               AND date_dim.d_year IN ( 2000, 2000 + 1, 2000 + 2 ) 
               AND store.s_county IN ( 'Williamson County', 'Williamson County', 
                                       'Williamson County', 
                                                             'Williamson County' 
                                     ) 
        GROUP  BY store_sales.ss_ticket_number, 
                  store_sales.ss_customer_sk) dj, 
       customer c 
WHERE  dj.ss_customer_sk = c.c_customer_sk 
       AND dj.cnt BETWEEN 1 AND 5 
ORDER  BY dj.cnt DESC, 
          c.c_last_name ASC; 
