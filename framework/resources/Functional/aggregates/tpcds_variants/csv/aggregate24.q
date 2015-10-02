select columns[8] as promo, sum(case columns[10] when '' then 0 else cast(columns[10] as int) end) as quantities from `store_sales.dat` group by columns[8] order by columns[8];
