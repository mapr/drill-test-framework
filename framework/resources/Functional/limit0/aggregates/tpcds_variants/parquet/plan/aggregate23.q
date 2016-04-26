explain plan for select * from (
select count(*) as cstar, count(c_customer_sk) as ccolumns from customer_v) t limit 0;
