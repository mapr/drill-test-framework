select * from (select d.type type, flatten(d.events) evnts, flatten(d.features) feats from `schema_changes` d) s where  s.evnts.type=s.feats.type;
