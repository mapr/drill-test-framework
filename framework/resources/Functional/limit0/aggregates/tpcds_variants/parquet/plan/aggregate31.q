explain plan for select * from (
select count(*) from store_sales_v where ss_quantity is null) t limit 0;
