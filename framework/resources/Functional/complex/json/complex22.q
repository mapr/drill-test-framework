select t.id, t.soa[0].`in`, t.soa[1].fl, t.soa[2].nul, t.soa[3].bool from `complex.json` t order by t.id limit 10;
