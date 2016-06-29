select *, avg(a1) over() from t1_v order by avg(a1) over();
