-- expected: mock echoes x-md6687-* request headers; the WHERE value must arrive as a header
select name, `value` from md6687_http.echo_headers where `header.X-Md6687-Token` = 'abc123'
