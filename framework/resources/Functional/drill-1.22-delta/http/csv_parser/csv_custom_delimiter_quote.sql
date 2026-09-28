-- expected: body is "id;name / 1;'a;b' / 2;'c'" with delimiter ';' and quote "'" (header row read by Drill) -> 2 rows, quoted ';' kept
select id, name from md6687_http.csv_custom
