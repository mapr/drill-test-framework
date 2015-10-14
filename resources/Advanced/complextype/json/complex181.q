select a.id, a.ooof.oa.oab.oabc, b.ooof.oa.oab.oabc, b.ooof.oa.oab, b.id from `complex.json` a left outer join `complex.json` b on a.ooof.oa.oab.oabc=b.ooof.oa.oab.oabc order by a.id limit 20;
