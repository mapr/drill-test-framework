-- expected: store.json.read_numbers_as_double=true -> FLOAT8 10.0
alter session set `store.json.read_numbers_as_double` = true;
--@test
select typeof(t.j.n) ty, t.j.n n from (select convert_fromJSON('{"n": 10}') j from (values(1))) t;
alter session reset `store.json.read_numbers_as_double`
