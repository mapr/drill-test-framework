explain plan for select * from (
select sum(ss_quantity) as total, avg(ss_quantity) as average from store_sales_v where ss_quantity is null) t limit 0;
