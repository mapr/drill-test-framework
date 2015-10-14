
select * from widestrings where tinyint_var > 5 and tinyint_var < 10;

-- GROUP BY --

-- group by on a wide column and agg on simple int
select str_fixed, sum(tinyint_var) from widestrings  where length(str_empty) > 0 and dec_var_prec5_sc2 < -100 group by str_fixed;
select str_var, sum(tinyint_var) from widestrings  where length(str_empty) > 0 and dec_var_prec5_sc2 < -100 group by str_var;
select str_null, sum(tinyint_var) from widestrings  where length(str_empty) > 0 and dec_var_prec5_sc2 < -100 group by str_null;
select str_empty, sum(tinyint_var) from widestrings  where length(str_empty) > 0 and length(str_var) < 4010  group by str_empty;
select str_empty_null, sum(tinyint_var) from widestrings  where length(str_empty) > 0 and length(str_var_null_empty) < 4010 group by str_empty_null;
select str_var_null_empty, sum(tinyint_var) from widestrings  where length(str_empty) > 0 and tinyint_var < -100 group by str_var_null_empty;
select str_fixed_null_empty, sum(tinyint_var) from widestrings  where length(str_empty) > 0 and dec_var_prec5_sc2 > 100 group by str_fixed_null_empty;


-- group by and projection on all wide columns
select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, count(*) from widestrings  where length(str_empty) > 0 and dec_var_prec5_sc2 < -100 group by str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty;


-- group by on simple int and agg on wide columns
select tinyint_var, avg(length(str_fixed)), count(*) from widestrings where tinyint_var < -120 group by tinyint_var;
select tinyint_var, avg(length(str_var)), count(*) from widestrings where tinyint_var < -120 group by tinyint_var;
select tinyint_var, avg(length(str_null)), count(*) from widestrings where tinyint_var < -120 group by tinyint_var;
select tinyint_var, avg(length(str_empty)), count(*) from widestrings where tinyint_var < -120 group by tinyint_var;
select tinyint_var, avg(length(str_empty_null)), count(*) from widestrings where tinyint_var < -120 group by tinyint_var;
select tinyint_var, avg(length(str_var_null_empty)), count(*) from widestrings where tinyint_var < -120 group by tinyint_var;
select tinyint_var, avg(length(str_fixed_null_empty)), count(*) from widestrings where tinyint_var < -120 group by tinyint_var;

-- both group by and agg on wide columns
select max(length(str_var)), max(length(str_null)), min(length(str_empty)), max(length(str_empty_null)), min(length(str_var_null_empty)), max(length(str_fixed_null_empty)) from widestrings where tinyint_var < -120 group by str_fixed;
select max(length(str_fixed)), max(length(str_null)), min(length(str_empty)), max(length(str_empty_null)), min(length(str_var_null_empty)), max(length(str_fixed_null_empty)) from widestrings where tinyint_var < -120 group by str_var;
select max(length(str_var)), max(length(str_fixed)), min(length(str_empty)), max(length(str_empty_null)), min(length(str_var_null_empty)), max(length(str_fixed_null_empty)) from widestrings where tinyint_var < -120 group by str_null;
select max(length(str_var)), max(length(str_null)), min(length(str_fixed)), max(length(str_empty_null)), min(length(str_var_null_empty)), max(length(str_fixed_null_empty)) from widestrings where tinyint_var < -120 group by str_empty;
select max(length(str_var)), max(length(str_null)), min(length(str_empty)), max(length(str_fixed)), min(length(str_var_null_empty)), max(length(str_fixed_null_empty)) from widestrings where tinyint_var < -120 group by str_empty_null;
select max(length(str_var)), max(length(str_null)), min(length(str_empty)), max(length(str_empty_null)), min(length(str_fixed)), max(length(str_fixed_null_empty)) from widestrings where tinyint_var < -120 group by str_var_null_empty;
select max(length(str_var)), max(length(str_null)), min(length(str_empty)), max(length(str_empty_null)), min(length(str_var_null_empty)), max(length(str_fixed)) from widestrings where tinyint_var < -120 group by str_fixed_null_empty;

-- group by on a wide column with a function applied
select count(*), max(dec_var_prec5_sc2), max(length(str_var)), max(length(str_null)), min(length(str_empty)), max(length(str_empty_null)), min(length(str_var_null_empty)), max(length(str_fixed_null_empty)) from widestrings where tinyint_var < -120 group by length(str_fixed);
select count(*), max(dec_var_prec5_sc2), max(length(str_fixed)), max(length(str_null)), min(length(str_empty)), max(length(str_empty_null)), min(length(str_var_null_empty)), max(length(str_fixed_null_empty)) from widestrings where tinyint_var < -120 group by length(str_var);
select count(*), max(dec_var_prec5_sc2), max(length(str_var)), max(length(str_fixed)), min(length(str_empty)), max(length(str_empty_null)), min(length(str_var_null_empty)), max(length(str_fixed_null_empty)) from widestrings where tinyint_var < -120 group by length(str_null);
select count(*), max(dec_var_prec5_sc2), max(length(str_var)), max(length(str_null)), min(length(str_fixed)), max(length(str_empty_null)), min(length(str_var_null_empty)), max(length(str_fixed_null_empty)) from widestrings where tinyint_var < -120 group by length(str_empty);
select count(*), max(dec_var_prec5_sc2), max(length(str_var)), max(length(str_null)), min(length(str_empty)), max(length(str_fixed)), min(length(str_var_null_empty)), max(length(str_fixed_null_empty)) from widestrings where tinyint_var < -120 group by length(str_empty_null);
select count(*), max(dec_var_prec5_sc2), max(length(str_var)), max(length(str_null)), min(length(str_empty)), max(length(str_empty_null)), min(length(str_fixed)), max(length(str_fixed_null_empty)) from widestrings where tinyint_var < -120 group by length(str_var_null_empty);
select count(*), max(dec_var_prec5_sc2), max(length(str_var)), max(length(str_null)), min(length(str_empty)), max(length(str_empty_null)), min(length(str_var_null_empty)), max(length(str_fixed)) from widestrings where tinyint_var < -120 group by length(str_fixed_null_empty);

-- group by and streaming aggregate
select max(length(sub.str_fixed)), max(length(sub.str_var)), max(length(sub.str_null)), min(length(sub.str_empty)), max(length(sub.str_empty_null)), min(length(sub.str_var_null_empty)), max(length(sub.str_fixed_null_empty)) from ( select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var from widestrings order by tinyint_var) sub group by sub.tinyint_var;

select max(sub.tinyint_var), max(length(sub.str_var)), max(length(sub.str_null)), min(length(sub.str_empty)), max(length(sub.str_empty_null)), min(length(sub.str_var_null_empty)), max(length(sub.str_fixed_null_empty)) from ( select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var from widestrings where tinyint_var < -120 order by lower(str_fixed)) sub group by sub.str_fixed;



select max(sub.tinyint_var), max(length(sub.str_fixed)), max(length(sub.str_null)), min(length(sub.str_empty)), max(length(sub.str_empty_null)), min(length(sub.str_var_null_empty)), max(length(sub.str_fixed_null_empty)) from ( select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var from widestrings where tinyint_var < -120  order by lower(str_var)) sub group by sub.str_var;

select max(sub.tinyint_var), max(length(sub.str_var)), max(length(sub.str_fixed)), min(length(sub.str_empty)), max(length(sub.str_empty_null)), min(length(sub.str_var_null_empty)), max(length(sub.str_fixed_null_empty)) from ( select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var from widestrings where tinyint_var < -120  order by lower(str_null)) sub group by sub.str_null;

select max(sub.tinyint_var), max(length(sub.str_var)), max(length(sub.str_null)), min(length(sub.str_fixed)), max(length(sub.str_empty_null)), min(length(sub.str_var_null_empty)), max(length(sub.str_fixed_null_empty)) from ( select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var from widestrings where tinyint_var < -120  order by lower(str_empty)) sub group by sub.str_empty;

select max(sub.tinyint_var), max(length(sub.str_var)), max(length(sub.str_null)), min(length(sub.str_empty)), max(length(sub.str_fixed)), min(length(sub.str_var_null_empty)), max(length(sub.str_fixed_null_empty)) from ( select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var from widestrings where tinyint_var < -120  order by lower(str_empty_null)) sub group by sub.str_empty_null;

select max(sub.tinyint_var), max(length(sub.str_var)), max(length(sub.str_null)), min(length(sub.str_empty)), max(length(sub.str_empty_null)), min(length(sub.str_fixed)), max(length(sub.str_fixed_null_empty)) from ( select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var from widestrings where tinyint_var < -120  order by lower(str_var_null_empty)) sub group by sub.str_var_null_empty;

select max(sub.tinyint_var), max(length(sub.str_var)), max(length(sub.str_null)), min(length(sub.str_empty)), max(length(sub.str_empty_null)), min(length(sub.str_var_null_empty)), max(length(sub.str_fixed)) from ( select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var from widestrings where tinyint_var < -120  order by lower(str_fixed_null_empty)) sub group by sub.str_fixed_null_empty;

-- plan verification to make sure streaming aggregate is used
explain plan for select max(length(sub.str_fixed)), max(length(sub.str_var)), max(length(sub.str_null)), min(length(sub.str_empty)), max(length(sub.str_empty_null)), min(length(sub.str_var_null_empty)), max(length(sub.str_fixed_null_empty)) from ( select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var from widestrings order by tinyint_var) sub group by sub.tinyint_var;

explain plan for select max(sub.tinyint_var), max(length(sub.str_var)), max(length(sub.str_null)), min(length(sub.str_empty)), max(length(sub.str_empty_null)), min(length(sub.str_var_null_empty)), max(length(sub.str_fixed_null_empty)) from ( select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var from widestrings order by lower(str_fixed)) sub group by sub.str_fixed;

explain plan for select max(sub.tinyint_var), max(length(sub.str_fixed)), max(length(sub.str_null)), min(length(sub.str_empty)), max(length(sub.str_empty_null)), min(length(sub.str_var_null_empty)), max(length(sub.str_fixed_null_empty)) from ( select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var from widestrings order by (str_var)) sub group by sub.str_var;

explain plan for select max(sub.tinyint_var), max(length(sub.str_var)), max(length(sub.str_fixed)), min(length(sub.str_empty)), max(length(sub.str_empty_null)), min(length(sub.str_var_null_empty)), max(length(sub.str_fixed_null_empty)) from ( select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var from widestrings order by lower(str_null)) sub group by sub.str_null;

explain plan for select max(sub.tinyint_var), max(length(sub.str_var)), max(length(sub.str_null)), min(length(sub.str_fixed)), max(length(sub.str_empty_null)), min(length(sub.str_var_null_empty)), max(length(sub.str_fixed_null_empty)) from ( select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var from widestrings order by lower(str_empty)) sub group by sub.str_empty;

explain plan for select max(sub.tinyint_var), max(length(sub.str_var)), max(length(sub.str_null)), min(length(sub.str_empty)), max(length(sub.str_fixed)), min(length(sub.str_var_null_empty)), max(length(sub.str_fixed_null_empty)) from ( select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var from widestrings order by lower(str_empty_null)) sub group by sub.str_empty_null;

explain plan for select max(sub.tinyint_var), max(length(sub.str_var)), max(length(sub.str_null)), min(length(sub.str_empty)), max(length(sub.str_empty_null)), min(length(sub.str_fixed)), max(length(sub.str_fixed_null_empty)) from ( select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var from widestrings order by lower(str_var_null_empty)) sub group by sub.str_var_null_empty;

explain plan for select max(sub.tinyint_var), max(length(sub.str_var)), max(length(sub.str_null)), min(length(sub.str_empty)), max(length(sub.str_empty_null)), min(length(sub.str_var_null_empty)), max(length(sub.str_fixed)) from ( select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var from widestrings order by lower(str_fixed_null_empty)) sub group by sub.str_fixed_null_empty;


-- group by and join together
select ws.*, sub.str_fixed str_fixed1 from widestrings ws INNER JOIN (select str_fixed, max(tinyint_var) max_ti from widestrings where length(str_var_null_empty) > 4900 group by str_fixed) sub on ws.tinyint_var = sub.max_ti where length(ws.str_var_null_empty) > 4995;
select ws.*, sub.str_fixed str_fixed1 from widestrings ws INNER JOIN (select str_fixed, max(tinyint_var) max_ti from widestrings where length(str_var_null_empty) > 4990 group by str_fixed) sub on ws.tinyint_var = sub.max_ti and ws.str_fixed=sub.str_fixed where length(ws.str_var_null_empty) > 4995;

select ws.*, sub.str_var str_var1 from widestrings ws INNER JOIN (select str_var, max(tinyint_var) max_ti from widestrings where tinyint_var > 120 and length(str_var_null_empty) > 4990 group by str_var) sub on ws.tinyint_var = sub.max_ti where length(ws.str_var_null_empty) > 4995;
select ws.*, sub.str_var str_var1 from widestrings ws INNER JOIN (select str_var, max(tinyint_var) max_ti from widestrings where tinyint_var > 120 and length(str_var_null_empty) > 4990 group by str_var) sub on ws.tinyint_var = sub.max_ti and ws.str_var=sub.str_var where length(ws.str_var_null_empty) > 4995;

select ws.*, sub.str_null str_null1 from widestrings ws INNER JOIN (select str_null, max(tinyint_var) max_ti from widestrings where tinyint_var > 120 and length(str_var_null_empty) > 4990 group by str_null) sub on ws.tinyint_var = sub.max_ti where length(ws.str_var_null_empty) > 4995;
select ws.*, sub.str_null str_null1 from widestrings ws INNER JOIN (select str_null, max(tinyint_var) max_ti from widestrings where tinyint_var > 120 and length(str_var_null_empty) > 4990 group by str_null) sub on ws.tinyint_var = sub.max_ti and ws.str_null=sub.str_null where length(ws.str_var_null_empty) > 4995;

select ws.*, sub.str_empty str_empty1 from widestrings ws INNER JOIN (select str_empty, max(tinyint_var) max_ti from widestrings where tinyint_var > 120 and length(str_var_null_empty) > 4990 group by str_empty) sub on ws.tinyint_var = sub.max_ti where length(ws.str_var_null_empty) > 4995;
select ws.*, sub.str_empty str_empty1 from widestrings ws INNER JOIN (select str_empty, max(tinyint_var) max_ti from widestrings where tinyint_var > 120 and length(str_var_null_empty) > 4990 group by str_empty) sub on ws.tinyint_var = sub.max_ti and ws.str_empty=sub.str_empty where length(ws.str_var_null_empty) > 4995;

select ws.*, sub.str_empty_null str_empty_null1 from widestrings ws INNER JOIN (select str_empty_null, max(tinyint_var) max_ti from widestrings where tinyint_var > 120 and length(str_var_null_empty) > 4990 group by str_empty_null) sub on ws.tinyint_var = sub.max_ti where length(ws.str_var_null_empty) > 4995;
select ws.*, sub.str_empty_null str_empty_null1 from widestrings ws INNER JOIN (select str_empty_null, max(tinyint_var) max_ti from widestrings where tinyint_var > 120 and length(str_var_null_empty) > 4990 group by str_empty_null) sub on ws.tinyint_var = sub.max_ti and ws.str_empty_null=sub.str_empty_null where length(ws.str_var_null_empty) > 4995;

select ws.*, sub.str_var_null_empty str_var_null_empty1 from widestrings ws INNER JOIN (select str_var_null_empty, max(tinyint_var) max_ti from widestrings where tinyint_var > 120 and length(str_var_null_empty) > 4990 group by str_var_null_empty) sub on ws.tinyint_var = sub.max_ti where length(ws.str_var_null_empty) > 4995;
select ws.*, sub.str_var_null_empty str_var_null_empty1 from widestrings ws INNER JOIN (select str_var_null_empty, max(tinyint_var) max_ti from widestrings where tinyint_var > 120 and length(str_var_null_empty) > 4990 group by str_var_null_empty) sub on ws.tinyint_var = sub.max_ti and ws.str_var_null_empty=sub.str_var_null_empty where length(ws.str_var_null_empty) > 4995;

select ws.*, sub.str_fixed_null_empty str_fixed_null_empty1 from widestrings ws INNER JOIN (select str_fixed_null_empty, max(tinyint_var) max_ti from widestrings where tinyint_var > 120 and length(str_var_null_empty) > 4990 group by str_fixed_null_empty) sub on ws.tinyint_var = sub.max_ti where length(ws.str_var_null_empty) > 4995;
select ws.*, sub.str_fixed_null_empty str_fixed_null_empty1 from widestrings ws INNER JOIN (select str_fixed_null_empty, max(tinyint_var) max_ti from widestrings where tinyint_var > 120 and length(str_var_null_empty) > 4990 group by str_fixed_null_empty) sub on ws.tinyint_var = sub.max_ti and ws.str_fixed_null_empty=sub.str_fixed_null_empty where length(ws.str_var_null_empty) > 4995;



-- FILTERS --

-- comparision operators
select * from widestrings where tinyint_var < 64 and tinyint_var > 0;
select * from widestrings where length(str_fixed) = 0 and tinyint_var between 10 and 15;
select * from widestrings where length(str_var) = 0 and tinyint_var between 10 and 15;
select * from widestrings where length(str_null) = 0 and length(str_var) < 4100;
select * from widestrings where length(str_empty) = 0 and length(str_var) between 4000 and 4100;
select * from widestrings where length(str_empty_null) = 0 and length(str_var) between 4400 and 4800
select * from widestrings where length(str_var_null_empty) = 0 and length(str_var) between 4900 and 5000;
select * from widestrings where length(str_fixed_null_empty) = 0 and length(str_var) between 4000 and 4010;

select * from widestrings where str_var_null_empty=str_fixed;
select * from widestrings where str_var_null_empty=str_var;
select * from widestrings where str_var_null_empty=str_null;
select * from widestrings where str_var_null_empty=str_empty;
select * from widestrings where str_var_null_empty=str_empty_null;
select * from widestrings where str_var_null_empty=str_fixed_null_empty;

-- null & not null
select * from widestrings where str_fixed is null and tinyint_var between 10 and 15;
select * from widestrings where str_var is null and dec_var_prec5_sc2 between 10 and 15;
select * from widestrings where str_null is null and dec_var_prec5_sc2 between 10 and 100;
select * from widestrings where str_empty is null and tinyint_var between -10 and 15;
select * from widestrings where str_empty_null is null and dec_var_prec5_sc2 between -1 and 2;
select * from widestrings where str_var_null_empty is null and tinyint_var between 0 and 15;
select * from widestrings where str_fixed_null_empty is null and tinyint_var between 100 and 128;

select * from widestrings where str_fixed is not null and tinyint_var between 10 and 15;
select * from widestrings where str_var is not null and dec_var_prec5_sc2 between 10 and 15;
select * from widestrings where str_null is not null and dec_var_prec5_sc2 between 10 and 100;
select * from widestrings where str_empty is not null and tinyint_var between -10 and 15
select * from widestrings where str_empty_null is not null and tinyint_var between -10 and 15
select * from widestrings where str_var_null_empty is not null and dec_var_prec5_sc2 between -28 and 15;
select * from widestrings where str_fixed_null_empty is not null and tinyint_var between 100 and 128;

-- like & not like
select * from widestrings where str_fixed like '%Abc%';
select * from widestrings where str_var like '%Abc%';
select * from widestrings where str_null like '%Abc%';
select * from widestrings where str_empty like '%Abc%';
select * from widestrings where str_empty_null like '%Abc%';
select * from widestrings where str_var_null_empty like '%Abc%';
select * from widestrings where str_fixed_null_empty like '%Abc%';


select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var, dec_var_prec5_sc2 from widestrings where str_fixed like '%Abc%';
select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var, dec_var_prec5_sc2 from widestrings where str_var like '%Abc%';
select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var, dec_var_prec5_sc2 from widestrings where str_null like '%Abc%';
select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var, dec_var_prec5_sc2 from widestrings where str_empty like '%Abc%';
select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var, dec_var_prec5_sc2 from widestrings where str_empty_null like '%Abc%';
select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var, dec_var_prec5_sc2 from widestrings where str_var_null_empty like '%Abc%';
select str_fixed, str_var, str_null, str_empty, str_empty_null, str_var_null_empty, str_fixed_null_empty, tinyint_var, dec_var_prec5_sc2 from widestrings where str_fixed_null_empty like '%Abc%';


select * from widestrings where UPPER(str_fixed) not like '%ABC%' and length(str_empty) > 0;
select * from widestrings where UPPER(str_var) not like '%ABC%' and length(str_empty) > 0;
select * from widestrings where UPPER(str_null) not like '%ABC%' and length(str_empty) > 0;
select * from widestrings where UPPER(str_empty) not like '%ABC%' and length(str_empty) > 0;
select * from widestrings where UPPER(str_empty_null) not like '%ABC%' and length(str_empty) > 0;
select * from widestrings where UPPER(str_var_null_empty) not like '%ABC%' and length(str_empty) > 0;
select * from widestrings where UPPER(str_fixed_null_empty) not like '%ABC%' and length(str_empty) > 0;

-- similar & not similar to
select * from widestrings where str_fixed similar to '%(Abc|abc|aBc|abC|ABC)%';
select * from widestrings where str_var similar to '%(Abc|abc|aBc|abC|ABC)%';
select * from widestrings where str_null similar to '%(Abc|abc|aBc|abC|ABC)%';
select * from widestrings where str_empty similar to '%(Abc|abc|aBc|abC|ABC)%';
select * from widestrings where str_empty_null similar to '%(Abc|abc|aBc|abC|ABC)%';
select * from widestrings where str_var_null_empty similar to '%(Abc|abc|aBc|abC|ABC)%';
select * from widestrings where str_fixed_null_empty similar to '%(Abc|abc|aBc|abC|ABC)%';

select * from widestrings where str_fixed not similar to '%(Abc|abc|aBc|abC|ABC)%' and length(str_empty) > 0;
select * from widestrings where str_var not similar to '%(Abc|abc|aBc|abC|ABC)%' and length(str_empty) > 0;
select * from widestrings where str_null not similar to '%(Abc|abc|aBc|abC|ABC)%' and length(str_empty) > 0;
select * from widestrings where str_empty not similar to '%(Abc|abc|aBc|abC|ABC)%' and length(str_empty) > 0;
select * from widestrings where str_empty_null not similar to '%(Abc|abc|aBc|abC|ABC)%' and length(str_empty) > 0;
select * from widestrings where str_var_null_empty not similar to '%(Abc|abc|aBc|abC|ABC)%' and length(str_empty) > 0;
select * from widestrings where str_fixed_null_empty not similar to '%(Abc|abc|aBc|abC|ABC)%' and length(str_empty) > 0;


-- FUNCTIONS
select position('ab' in str_fixed) from widestrings;
select position('ab' in str_var) from widestrings;
select position('ab' in str_empty) from widestrings;
select position('ab' in str_null) from widestrings;
select position('ab' in str_empty_null) from widestrings;
select position('ab' in str_var_null_empty) from widestrings;
select position('ab' in str_fixed_null_empty) from widestrings;


select SUBSTRING(str_fixed, 50, 2000) from widestrings;
select SUBSTRING(str_var, 50, 2000) from widestrings;
select SUBSTRING(str_empty, 50, 2000) from widestrings;
select SUBSTRING(str_null, 50, 2000) from widestrings;
select SUBSTRING(str_empty_null, 50, 2000) from widestrings;
select SUBSTRING(str_var_null_empty, 50, 2000) from widestrings;
select SUBSTRING(str_fixed_null_empty, 50, 2000) from widestrings;

select repeat(str_fixed, 2) from widestrings where length(str_empty) > 0;
select repeat(str_var, 2) from widestrings where length(str_empty) > 0;
select repeat(str_empty, 2) from widestrings where length(str_empty) > 0;
select repeat(str_null, 2) from widestrings where length(str_empty) > 0;
select repeat(str_empty_null, 2) from widestrings where length(str_empty) > 0;
select repeat(str_var_null_empty, 2) from widestrings where length(str_empty) > 0;
select repeat(str_fixed_null_empty, 2) from widestrings where length(str_empty) > 0;


-- HASH JOIN --

select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_fixed_null_empty=ws2.str_var_null_empty where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on length(ws1.str_fixed_null_empty)=length(ws2.str_var_null_empty) where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
select ws1.* from widestrings ws1 INNER JOIN (select str_var_null_empty from widestrings where str_var_null_empty is not null and length(str_var_null_empty) <> 0 )ws2 on ws1.str_fixed_null_empty=ws2.str_var_null_empty where ws1.str_fixed_null_empty is not null and length(ws1.str_fixed_null_empty) <> 0 and length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;

select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_fixed=ws2.str_var_null_empty where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on length(ws1.str_fixed)=length(ws2.str_var_null_empty) where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
select ws1.* from widestrings ws1 INNER JOIN (select str_var_null_empty from widestrings where str_var_null_empty is not null and length(str_var_null_empty) <> 1 )ws2 on ws1.str_fixed=ws2.str_var_null_empty where ws1.str_fixed is not null and length(ws1.str_fixed) <> 0 and length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;

select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_var=ws2.str_var_null_empty where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on length(ws1.str_var)=length(ws2.str_var_null_empty) where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
select ws1.* from widestrings ws1 INNER JOIN (select str_var_null_empty from widestrings where str_var_null_empty is not null and length(str_var_null_empty) <> 0 )ws2 on ws1.str_var=ws2.str_var_null_empty where ws1.str_var is not null and length(ws1.str_var) <> 0 and length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;

select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_null=ws2.str_var_null_empty where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on length(ws1.str_null)=length(ws2.str_var_null_empty) where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
select ws1.* from widestrings ws1 INNER JOIN (select str_var_null_empty from widestrings where str_var_null_empty is not null and length(str_var_null_empty) <> 0 )ws2 on ws1.str_null=ws2.str_var_null_empty where ws1.str_null is not null and length(ws1.str_null) <> 0 and length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;

select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_empty=ws2.str_var_null_empty where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on length(ws1.str_empty)=length(ws2.str_var_null_empty) where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
select ws1.* from widestrings ws1 INNER JOIN (select str_var_null_empty from widestrings where str_var_null_empty is not null and length(str_var_null_empty) <> 0 )ws2 on ws1.str_empty=ws2.str_var_null_empty where ws1.str_empty is not null and length(ws1.str_empty) <> 0 and length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;

select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_empty_null=ws2.str_var_null_empty where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on length(ws1.str_empty_null)=length(ws2.str_var_null_empty) where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
select ws1.* from widestrings ws1 INNER JOIN (select str_var_null_empty from widestrings where str_var_null_empty is not null and length(str_var_null_empty) <> 0 )ws2 on ws1.str_empty_null=ws2.str_var_null_empty where ws1.str_empty_null is not null and length(ws1.str_empty_null) <> 0 and length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;

select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_var_null_empty=ws2.str_var_null_empty where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on length(ws1.str_var_null_empty)=length(ws2.str_var_null_empty) where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
select ws1.* from widestrings ws1 INNER JOIN (select str_var_null_empty from widestrings where str_var_null_empty is not null and length(str_var_null_empty) <> 0 )ws2 on ws1.str_var_null_empty=ws2.str_var_null_empty where ws1.str_var_null_empty is not null and length(ws1.str_var_null_empty) <> 0 and length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;


-- MERGE JOIN
alter session set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_fixed_null_empty=ws2.str_var_null_empty where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
alter session set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on length(ws1.str_fixed_null_empty)=length(ws2.str_var_null_empty) where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
alter session set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN (select str_var_null_empty from widestrings where str_var_null_empty is not null and length(str_var_null_empty) <> 0 )ws2 on ws1.str_fixed_null_empty=ws2.str_var_null_empty where ws1.str_fixed_null_empty is not null and length(ws1.str_fixed_null_empty) <> 0 and length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;

alter session set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_fixed=ws2.str_var_null_empty where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
alter session set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on length(ws1.str_fixed)=length(ws2.str_var_null_empty) where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
alter session set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN (select str_var_null_empty from widestrings where str_var_null_empty is not null and length(str_var_null_empty) <> 1 )ws2 on ws1.str_fixed=ws2.str_var_null_empty where ws1.str_fixed is not null and length(ws1.str_fixed) <> 0 and length(ws2.str_var_null_empty) > 4800;


alter session set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_var=ws2.str_var_null_empty where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
alter session set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on length(ws1.str_var)=length(ws2.str_var_null_empty) where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
alter session set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN (select str_var_null_empty from widestrings where str_var_null_empty is not null and length(str_var_null_empty) <> 0 )ws2 on ws1.str_var=ws2.str_var_null_empty where ws1.str_var is not null and length(ws1.str_var) <> 0 and length(ws2.str_var_null_empty) > 4800;


alter session set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_null=ws2.str_var_null_empty where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
alter session set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on length(ws1.str_null)=length(ws2.str_var_null_empty) where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
alter session set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN (select str_var_null_empty from widestrings where str_var_null_empty is not null and length(str_var_null_empty) <> 0 )ws2 on ws1.str_null=ws2.str_var_null_empty where ws1.str_null is not null and length(ws1.str_null) <> 0 and length(ws2.str_var_null_empty) > 4800;


alter session set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_empty=ws2.str_var_null_empty where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
alter session set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on length(ws1.str_empty)=length(ws2.str_var_null_empty) where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
alter session set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN (select str_var_null_empty from widestrings where str_var_null_empty is not null and length(str_var_null_empty) <> 0 )ws2 on ws1.str_empty=ws2.str_var_null_empty where ws1.str_empty is not null and length(ws1.str_empty) <> 0 and length(ws2.str_var_null_empty) > 4800;


alter session set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_empty_null=ws2.str_var_null_empty where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
alter session set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on length(ws1.str_empty_null)=length(ws2.str_var_null_empty) where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
alter sessioe set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN (select str_var_null_empty from widestrings where str_var_null_empty is not null and length(str_var_null_empty) <> 0 )ws2 on ws1.str_empty_null=ws2.str_var_null_empty where ws1.str_empty_null is not null and length(ws1.str_empty_null) <> 0 and length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;

alter session set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_var_null_empty=ws2.str_var_null_empty  where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
alter session set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN widestrings ws2 on length(ws1.str_var_null_empty)=length(ws2.str_var_null_empty) where length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;
alter session set planner.enable_hashjoin = false;
select ws1.* from widestrings ws1 INNER JOIN (select str_var_null_empty from widestrings where str_var_null_empty is not null and length(str_var_null_empty) <> 0 )ws2 on ws1.str_var_null_empty=ws2.str_var_null_empty where ws1.str_var_null_empty is not null and length(ws1.str_var_null_empty) <> 0 and length(ws1.str_var_null_empty) > 4995 and length(ws2.str_var_null_empty) > 4800;


-- ORDER BY --
select * from widestrings where length(str_var_null_empty) > 4995 order by tinyint_var;
select * from widestrings where length(str_var_null_empty) > 4995  order by dec_var_prec5_sc2;
select * from widestrings where length(str_var_null_empty) > 4995  order by lower(str_fixed);
select * from widestrings where length(str_var_null_empty) > 4995  order by lower(str_var);
select * from widestrings where length(str_var_null_empty) > 4995  order by lower(str_null);
select * from widestrings where length(str_var_null_empty) > 4995  order by lower(str_empty);
select * from widestrings where length(str_var_null_empty) > 4995  order by lower(str_var_null_empty);
select * from widestrings where length(str_var_null_empty) > 4995  order by lower(str_empty_null);
select * from widestrings where length(str_var_null_empty) > 4995  order by lower(str_fixed_null_empty);

select * from widestrings where length(str_var_null_empty) > 4995  order by lower(str_fixed), tinyint_var;
select * from widestrings where length(str_var_null_empty) > 4995  order by lower(str_var), tinyint_var;
select * from widestrings where length(str_var_null_empty) > 4995  order by lower(str_null), tinyint_var;
select * from widestrings where length(str_var_null_empty) > 4995  order by lower(str_empty), tinyint_var;
select * from widestrings where length(str_var_null_empty) > 4995  order by lower(str_empty_null), tinyint_var;
select * from widestrings where length(str_var_null_empty) > 4995  order by lower(str_fixed_null_empty), tinyint_var;
select * from widestrings where length(str_var_null_empty) > 4995  order by lower(str_var_null_empty), tinyint_var;

select * from widestrings where length(str_var_null_empty) > 4995  order by lower(str_fixed), lower(str_var_null_empty);
select * from widestrings where length(str_var_null_empty) > 4995  order by lower(str_var), lower(str_var_null_empty);
select * from widestrings where length(str_var_null_empty) > 4995  order by lower(str_empty), lower(str_var_null_empty);
select * from widestrings where length(str_var_null_empty) > 4995  order by lower(str_null), lower(str_var_null_empty);
select * from widestrings where length(str_var_null_empty) > 4995  order by lower(str_empty_null), lower(str_var_null_empty);
select * from widestrings where length(str_var_null_empty) > 4995  order by lower(str_fixed_null_empty), lower(str_var_null_empty);

select * from widestrings where length(str_var_null_empty) > 4995  order by length(str_fixed), length(str_var_null_empty);
select * from widestrings where length(str_var_null_empty) > 4995  order by length(str_var), length(str_var_null_empty);
select * from widestrings where length(str_var_null_empty) > 4995  order by length(str_empty), length(str_var_null_empty);
select * from widestrings where length(str_var_null_empty) > 4995  order by length(str_null), length(str_var_null_empty);
select * from widestrings where length(str_var_null_empty) > 4995  order by length(str_empty_null), length(str_var_null_empty);
select * from widestrings where length(str_var_null_empty) > 4995  order by length(str_fixed_null_empty), length(str_var_null_empty);

select * from (select str_fixed_null_empty, str_var_null_empty, tinyint_var from widestrings  where length(str_var_null_empty) > 4995 order by  lower(str_var_null_empty), lower(str_null)) sub order by tinyint_var, lower(sub.str_fixed_null_empty);

select sub.str_empty from (select str_var_null_empty, str_empty from widestrings order by tinyint_var) sub  where length(sub.str_var_null_empty) > 4995 order by lower(sub.str_var_null_empty);

select sub.str_fixed_null_empty from (select str_fixed_null_empty, str_var_null_empty from widestrings order by lower(str_null) asc) sub where length(sub.str_var_null_empty) > 4995  order by lower(sub.str_fixed_null_empty) desc;
select sub.str_var_null_empty from (select str_var_null_empty from widestrings order by lower(str_null) asc) sub  where length(sub.str_var_null_empty) > 4995 order by lower(sub.str_var_null_empty) desc;
select sub.str_empty_null from (select str_empty_null, str_var_null_empty from widestrings order by lower(str_null) asc) sub where length(sub.str_var_null_empty) > 4995  order by lower(sub.str_empty_null) desc;
select sub.str_fixed from (select str_fixed, str_var_null_empty from widestrings order by lower(str_null) asc) sub where length(sub.str_var_null_empty) > 4995 order by lower(sub.str_fixed) desc;
select sub.str_var from (select str_var, str_var_null_empty from widestrings order by lower(str_null) asc) sub where length(sub.str_var_null_empty) > 4995  order by lower(sub.str_var) desc;
select sub.str_null from (select str_null, str_var_null_empty from widestrings order by lower(str_null) asc) sub where length(sub.str_var_null_empty) > 4995  order by lower(sub.str_null) desc;


select ws2.str_var_null_empty, max(ws1.tinyint_var) from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_fixed=ws2.str_var_null_empty group by ws2.str_var_null_empty order by lower(ws2.str_var_null_empty) limit 100;
select ws2.str_fixed, max(ws1.tinyint_var) from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_fixed=ws2.str_var_null_empty group by ws2.str_fixed order by lower(ws2.str_fixed) limit 100;
select ws2.str_var, max(ws1.tinyint_var) from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_var=ws2.str_var_null_empty group by ws2.str_var order by lower(ws2.str_var) limit 100;
select ws2.str_null, max(ws1.tinyint_var) from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_null=ws2.str_var_null_empty group by ws2.str_null order by lower(ws2.str_null) limit 100;
select ws2.str_empty, max(ws1.tinyint_var) from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_empty=ws2.str_var_null_empty group by ws2.str_empty order by lower(ws2.str_empty) limit 100;
select ws2.str_empty_null, max(ws1.tinyint_var) from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_empty_null=ws2.str_var_null_empty group by ws2.str_empty_null order by lower(ws2.str_empty_null) limit 100;
select ws2.str_fixed_null_empty, max(ws1.tinyint_var) from widestrings ws1 INNER JOIN widestrings ws2 on ws1.str_fixed_null_empty=ws2.str_var_null_empty group by ws2.str_fixed_null_empty order by lower(ws2.str_fixed_null_empty) limit 100;




--- TODO UNION ALL & EXTERNAL SORT
--- Modify Merge Join queries to alter session
--- add explain plan queries

