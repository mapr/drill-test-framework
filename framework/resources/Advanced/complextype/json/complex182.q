select a.id, a.ooos.oa.oab.oabc, b.ooos.oa.oab.oabc, b.ooof.oa.oab from `complex.json` a left outer join `complex.json` b on a.ooos.oa.oab.oabc=b.ooos.oa.oab.oabc order by a.id limit 20;
