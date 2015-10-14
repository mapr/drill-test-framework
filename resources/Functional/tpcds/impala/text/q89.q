select
*
from
(select
i.i_category as icat,
i.i_class as icla,
i.i_brand as ibra,
s.s_store_name as ssname,
s.s_company_name as scname,
d.d_moy as dmoy,
sum(ss.ss_sales_price) sum_sales
-- avg(sum(ss.ss_sales_price)) over (partition by i.i_category, i.i_brand, s.s_store_name, s.s_company_name) avg_monthly_sales
from
item as i,
store_sales as ss,
date_dim as d,
store as s
where
ss.ss_item_sk = i.i_item_sk
and ss.ss_sold_date_sk = d.d_date_sk
and ss.ss_store_sk = s.s_store_sk
and d.d_year in (2000)
and ((i.i_category in ('Home', 'Books', 'Electronics')
and i.i_class in ('wallpaper', 'parenting', 'musical'))
or (i.i_category in ('Shoes', 'Jewelry', 'Men')
and i.i_class in ('womens', 'birdal', 'pants')))
and ss.ss_sold_date_sk between 2451545 and 2451910  -- partition key filter
group by
i.i_category,
i.i_class,
i.i_brand,
s.s_store_name,
s.s_company_name,
d.d_moy
) tmp1
-- where
--   case when (avg_monthly_sales <> 0) then (abs(sum_sales - avg_monthly_sales) / avg_monthly_sales) else null end > 0.1
order by
-- sum_sales - avg_monthly_sales,
tmp1.sum_sales,  -- modification
tmp1.ssname
limit 100;

