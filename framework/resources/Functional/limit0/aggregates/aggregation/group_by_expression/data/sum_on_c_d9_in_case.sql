select c_boolean, (CASE when (c_boolean is null) then ROUND(SUM(d9/12)) else CAST(SUM(CASE when (d9 is null) then 0 else d9*1.2 end) as bigint)  end) from alltypes_v group by c_boolean order by c_boolean;
