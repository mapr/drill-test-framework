-- start query 68 in stream 0 using template query68.tpl 
SELECT customer.c_last_name, 
               customer.c_first_name, 
               current_addr.ca_city, 
               dn.bought_city, 
               dn.ss_ticket_number, 
               dn.extended_price, 
               dn.extended_tax, 
               dn.list_price 
FROM   (SELECT store_sales.ss_ticket_number, 
               store_sales.ss_customer_sk, 
               customer_address.ca_city                 bought_city, 
               Sum(store_sales.ss_ext_sales_price) extended_price, 
               Sum(store_sales.ss_ext_list_price)  list_price, 
               Sum(store_sales.ss_ext_tax)         extended_tax 
        FROM   store_sales, 
               date_dim, 
               store, 
               household_demographics, 
               customer_address
        WHERE  store_sales.ss_sold_date_sk = date_dim.d_date_sk 
               AND store_sales.ss_store_sk = store.s_store_sk 
               AND store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk 
               AND store_sales.ss_addr_sk = customer_address.ca_address_sk 
               AND date_dim.d_dom BETWEEN 1 AND 2 
               AND ( household_demographics.hd_dep_count = 8 
                      OR household_demographics.hd_vehicle_count = 3 ) 
               AND date_dim.d_year IN ( 1998, 1998 + 1, 1998 + 2 ) 
               AND store.s_city IN ( 'Fairview', 'Midway' ) 
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
          dn.ss_ticket_number
LIMIT 100; 
