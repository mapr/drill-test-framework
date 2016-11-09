select substr(cast(age(date_add(max(O_ORDERDate),date_part('year',min(O_ORDERDate)))) as varchar(10)),4,5) as age from orders;
