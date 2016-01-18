-- start query 79 in stream 0 using template query79.tpl 
SELECT customer.c_last_name, 
               customer.c_first_name, 
               Substr(ms.s_city, 1, 30), 
               ms.ss_ticket_number, 
               ms.amt, 
               ms.profit 
FROM   (SELECT store_sales.ss_ticket_number, 
               store_sales.ss_customer_sk, 
               store.s_city, 
               Sum(store_sales.ss_coupon_amt) amt, 
               Sum(store_sales.ss_net_profit) profit 
        FROM   store_sales, 
               date_dim, 
               store, 
               household_demographics 
        WHERE  store_sales.ss_sold_date_sk = date_dim.d_date_sk 
               AND store_sales.ss_store_sk = store.s_store_sk 
               AND store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk 
               AND ( household_demographics.hd_dep_count = 8 
                      OR household_demographics.hd_vehicle_count > 4 ) 
               AND date_dim.d_dow = 1 
               AND date_dim.d_year IN ( 2000, 2000 + 1, 2000 + 2 ) 
               AND store.s_number_employees BETWEEN 200 AND 295 
        GROUP  BY store_sales.ss_ticket_number, 
                  store_sales.ss_customer_sk, 
                  store_sales.ss_addr_sk, 
                  store.s_city) ms, 
       customer 
WHERE  ms.ss_customer_sk = customer.c_customer_sk 
ORDER  BY customer.c_last_name, 
          customer.c_first_name, 
          Substr(ms.s_city, 1, 30), 
          ms.profit
LIMIT 100; 
