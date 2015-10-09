-- verify that the sqlline output contains " kvgen function only supports Simple maps as input"
select kvgen(d.map1) from `DRILL-2200.json` d; 
