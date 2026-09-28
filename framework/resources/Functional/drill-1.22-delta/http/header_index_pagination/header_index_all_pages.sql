-- expected: mock serves ids 0..24 over 3 pages linked by the 'link' response header -> 25 rows, 25 distinct
select count(*) cnt, count(distinct id) dist, min(id) mn, max(id) mx from md6687_http.header_index
