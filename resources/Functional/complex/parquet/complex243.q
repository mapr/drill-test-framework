select t.id, concat(t.soa[3].str,t.ooa[2].a.aa.aaa,t.ooa[2].c.cc.ccc) from `complex.json` t order by t.id limit 11;
