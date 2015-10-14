select a.id, a.fl, a.nul, a.bool from `complex.json` a left join `complex.json` b on a.id=b.id order by a.id limit 20;
