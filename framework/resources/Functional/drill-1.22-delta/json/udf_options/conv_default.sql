-- expected: default options -> integer literal stays BIGINT
select typeof(t.j.n) ty, t.j.n n from (select convert_fromJSON('{"n": 10}') j from (values(1))) t
