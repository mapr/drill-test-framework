select a.id, a.ooof.oa.oab.oabc, b.ooof.oa.oab.oabc from `complex.json` a inner join `complex.json` b on a.ooof.oa.oab.oabc=b.ooof.oa.oab.oabc where a.id in (1,2,3,4,5,100,3000,55555,1000000,1000001) order by a.id;