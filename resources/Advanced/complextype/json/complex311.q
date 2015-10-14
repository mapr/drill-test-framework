select tt.id, tt.g1[0].key, tt.g1[0].`value`.oabc, tt.g2[0].`value` from (select t.id, kvgen(t.oooi.oa) g1, kvgen(t.oooi.oa.oab) g2 from `complex.json` t order by t.id limit 5) tt;
