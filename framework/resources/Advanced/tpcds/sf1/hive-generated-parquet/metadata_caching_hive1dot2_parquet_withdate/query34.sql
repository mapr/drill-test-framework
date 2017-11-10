-- start query 34 in stream 0 using template query34.tpl 
SELECT c.c_last_name, 
       c.c_first_name, 
       c.c_salutation, 
       c.c_preferred_cust_flag, 
       dn.ss_ticket_number, 
       dn.cnt 
FROM   (SELECT ss.ss_ticket_number, 
               ss.ss_customer_sk, 
               Count(*) cnt 
        FROM   store_sales ss, 
               date_dim, 
               store, 
               household_demographics 
        WHERE  ss.ss_sold_date_sk = date_dim.d_date_sk 
               AND ss.ss_store_sk = store.s_store_sk 
               AND ss.ss_hdemo_sk = household_demographics.hd_demo_sk 
               AND ( date_dim.d_dom BETWEEN 1 AND 3 
                      OR date_dim.d_dom BETWEEN 25 AND 28 ) 
               AND ( household_demographics.hd_buy_potential = '>10000' 
                      OR household_demographics.hd_buy_potential = 'unknown' ) 
               AND household_demographics.hd_vehicle_count > 0 
               AND ( CASE 
                       WHEN household_demographics.hd_vehicle_count > 0 THEN 
                       household_demographics.hd_dep_count / 
                       household_demographics.hd_vehicle_count 
                       ELSE NULL 
                     END ) > 1.2 
               AND date_dim.d_year IN ( 1999, 1999 + 1, 1999 + 2 ) 
               AND store.s_county IN ( 'Williamson County', 'Williamson County', 
                                       'Williamson County', 
                                                             'Williamson County' 
                                       , 
                                       'Williamson County', 'Williamson County', 
                                           'Williamson County', 
                                                             'Williamson County' 
                                     )
        GROUP  BY ss.ss_ticket_number, 
                  ss.ss_customer_sk) dn, 
       customer c
WHERE  dn.ss_customer_sk = c.c_customer_sk 
       AND dn.cnt BETWEEN 15 AND 20 
ORDER  BY c.c_last_name, 
          c.c_first_name, 
          c.c_salutation, 
          c.c_preferred_cust_flag DESC; 
