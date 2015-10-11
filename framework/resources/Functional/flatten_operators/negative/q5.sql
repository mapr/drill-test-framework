-- DRILL-2183
select uid , flatten(field_not_present) from `data1.json`; 
