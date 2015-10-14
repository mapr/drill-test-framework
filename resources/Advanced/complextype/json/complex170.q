select a.id, a.gbyi, a.str, a.sia from `complex.json` a left join `complex.json` b on a.str=b.str order by a.id limit 20;
