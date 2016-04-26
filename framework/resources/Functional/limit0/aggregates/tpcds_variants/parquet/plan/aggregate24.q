explain plan for select * from (
select ss_promo_sk as promo, sum(ss_quantity) as quantities from store_sales_v group by ss_promo_sk order by ss_promo_sk) t limit 0;
