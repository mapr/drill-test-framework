-- expected: store.json.all_text_mode=true -> VARCHAR '10'
alter session set `store.json.all_text_mode` = true;
--@test
select typeof(t.j.n) ty, t.j.n n from (select convert_fromJSON('{"n": 10}') j from (values(1))) t;
alter session reset `store.json.all_text_mode`
