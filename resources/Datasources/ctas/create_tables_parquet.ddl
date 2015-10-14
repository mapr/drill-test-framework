alter session set `store.format` = 'parquet';

create table ctas_t1(c1, c2, c3, c4) as
select  j1.c_varchar,
        j2.c_varchar,
        j1.c_date,
        j2.c_date
from
        dfs.`ctas`.`j1` inner join dfs.`ctas`.`j2` ON (j1.c_timestamp = j2.c_timestamp and j1.c_date between '1960-01-03' and '1960-01-15' )
where
        j1.c_bigint IS NOT DISTINCT FROM j2.c_bigint
        and j1.c_timestamp IS NOT NULL
;

create table ctas_t2(c1, c2) as  
select  
        j1.c_bigint,
        coalesce(j3.c_bigint, -1000)
from    
        dfs.`ctas`.`j1` left outer join dfs.`ctas`.`j3` ON (j1.c_time = j3.c_time)
where   
        j1.c_boolean IS NULL
        and j1.d9 > 0
;      

create table ctas_t3 as
select  j4.c_varchar || j2.c_varchar as c1
from    
        dfs.`ctas`.`j4` right outer join dfs.`ctas`.`j2` on (j2.c_integer = j4.c_integer)
;  

create table ctas_t4 as
select  concat(j4.c_varchar, j2.c_varchar) as c1
from    
        dfs.`ctas`.`j4` right outer join dfs.`ctas`.`j2` on (j2.c_integer = j4.c_integer)
;   

create table ctas_t5(count_star, max_j1_c_int, min_j2_c_int, avg_j1_c_int, avg_j2_c_int) as
select  
        count(*),
        max(j1.c_integer),
        min(j2.c_integer),
        avg(j1.c_integer),
        avg(j2.c_integer)
from    
        dfs.`ctas`.`j1` full outer join dfs.`ctas`.`j2` on (j1.c_date = j2.c_date)
where   
        j1.c_boolean is false
;

/* create table ctas_t6(c1,c2,c3,c4,c5) as select c_integer, c_bigint, c_date, c_time, c_varchar from dfs.`ctas`.`j4` where c_bigint is null; */

create table ctas_t8(c1) as select distinct c_integer from ( select c_integer from dfs.`ctas`.`j1` union all select c_integer from dfs.`ctas`.`j2`) as xyz;

create table ctas_t9 as
select  c_integer          as c1,
        count(c_date)      as c2 
from    
        dfs.`ctas`.`j1`
group by 
        c_integer
order by 
        c_integer;


create table ctas_t10 (c1, c2) as
select  
        count(distinct c_integer),
        sum(c_integer)
from    
        dfs.`ctas`.`j1`
group by 
        c_date
order by 
        c_date;

create table ctas_t11 as 
select  
        count(distinct d9) as count_distinct_d9, 
        sum(d9)            as sum_d9 
from    
        (
        select
                d9,
                c_date,
                c_timestamp
        from    dfs.`ctas`.`j3`
        ) as sq 
group by 
        c_date 
order by 
        c_date,
        sum(d9) desc nulls first;

create table ctas_t12 (c1, c2, c3) as
select
        count(distinct c_bigint) ,
        sum(c_bigint)            ,
        count(c_date)            
from
        dfs.`ctas`.`j4`
group by
        c_boolean,
        c_timestamp
order by
        2
;

create table ctas_t13 (c1, c2)  as
select  
        count(distinct d18),
        sum(d18) 
from    
        (
        select  distinct 
                d18,
                c_date, 
                c_varchar  
        from
                dfs.`ctas`.`j1`
        ) as sq
group by 
        c_varchar;

create table ctas_t14(x, y) as 
select  
        c_date,
        count(distinct c_time)
from    
        dfs.`ctas`.`j4`
group by 
        c_date  
order by 
        c_date limit 10 offset 900;

create table ctas_t15 as 
select  
        count(distinct c_integer) as count_distinct_1,
        count(distinct c_varchar) as count_distinct_2,
        count(distinct c_time) as count_distinct_3
from    
        dfs.`ctas`.`j1`
group by 
        c_time
;      
