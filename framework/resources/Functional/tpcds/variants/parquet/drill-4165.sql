alter session set `planner.enable_hashjoin` = false;

select count(*) from store_sales ss1, store_sales ss2 where ss1.ss_customer_sk = ss2.ss_customer_sk and ss1.ss_store_sk = 1 and ss2.ss_store_sk = 2;

alter session set `planner.enable_hashjoin` = true;
