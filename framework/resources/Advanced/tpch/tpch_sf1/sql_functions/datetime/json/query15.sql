select substr(cast(age(date_add(max(cast (O_ORDERDate as Date)),date_part('year',min(cast (O_ORDERDate as Date))))) as varchar(10)),4,5) as age from orders;
