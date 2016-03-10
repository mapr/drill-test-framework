-- start query 46 in stream 0 using template query46.tpl 
SELECT customer.c_last_name, 
               customer.c_first_name, 
               current_addr.ca_city, 
               dn.bought_city, 
               dn.ss_ticket_number, 
               dn.amt, 
               dn.profit 
FROM   (SELECT store_sales.ss_ticket_number, 
               store_sales.ss_customer_sk, 
               customer_address.ca_city            bought_city, 
               Sum(store_sales.ss_coupon_amt) amt, 
               Sum(store_sales.ss_net_profit) profit 
        FROM   store_sales, 
               date_dim, 
               store, 
               household_demographics, 
               customer_address 
        WHERE  store_sales.ss_sold_date_sk = date_dim.d_date_sk 
               AND store_sales.ss_store_sk = store.s_store_sk 
               AND store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk 
               AND store_sales.ss_addr_sk = customer_address.ca_address_sk 
               AND ( household_demographics.hd_dep_count = 6 
                      OR household_demographics.hd_vehicle_count = 0 ) 
               AND date_dim.d_dow IN ( 6, 0 ) 
               AND date_dim.d_year IN ( 2000, 2000 + 1, 2000 + 2 ) 
               AND store.s_city IN ( 'Midway', 'Fairview', 'Fairview', 
                                     'Fairview', 
                                     'Fairview' ) 
        GROUP  BY store_sales.ss_ticket_number, 
                  store_sales.ss_customer_sk, 
                  store_sales.ss_addr_sk, 
                  customer_address.ca_city) dn, 
       customer, 
       customer_address current_addr 
WHERE  dn.ss_customer_sk = customer.c_customer_sk 
       AND customer.c_current_addr_sk = current_addr.ca_address_sk 
       AND current_addr.ca_city <> dn.bought_city 
ORDER  BY customer.c_last_name, 
          customer.c_first_name, 
          current_addr.ca_city, 
          dn.bought_city, 
          dn.ss_ticket_number
LIMIT 100; 
