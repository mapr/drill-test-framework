-- expected: 25 rows over pages of 5; every request carried offset and limit exactly once
select count(*) cnt, sum(case when offset_count = 1 and limit_count = 1 then 1 else 0 end) ok from md6687_http.offset_paged
