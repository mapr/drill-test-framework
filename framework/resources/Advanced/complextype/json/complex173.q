select count(a.id) from `complex.json` a left outer join `complex.json` b on a.sfa[0]=b.sfa[1];
