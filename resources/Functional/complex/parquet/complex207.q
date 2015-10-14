select t.gbyi, max(t.sfa[1]) maxsfa from `complex.json` t group by t.gbyi having max(t.sfa[1]) > 10000 order by maxsfa;
