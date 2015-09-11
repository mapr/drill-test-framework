select sum(ss_quantity) as total, avg(ss_quantity) as average from store_sales where ss_quantity is null;
