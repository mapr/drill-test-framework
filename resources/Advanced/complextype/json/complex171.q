select a.id, b.sia, a.sfa[0], b.soa[0].`in` from `complex.json` a left outer join `complex.json` b on a.sia[0]=b.sia[0] order by a.id limit 20;
