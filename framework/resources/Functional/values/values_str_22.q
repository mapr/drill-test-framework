SELECT id FROM (VALUES(''),('asdfkjhasdjkhgavdjhkgdvkjhg'),('aaaaa'),(''),('zzzzzzz'),('a'),('z'),('non-null-value')) tbl(id) WHERE NULLIF(id,'') IS NOT NULL;
