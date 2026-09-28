-- expected: same body as delta csv test; enabling header extraction must still yield columns id/name and 2 rows
select id, name from md6687_http.csv_header_extraction
