select t.id, t.nul, hash64(t.nul, hash64(t.id)) as hash_value from `complex.json` t where t.nul is null order by t.id limit 10;
