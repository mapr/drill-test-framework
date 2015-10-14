select s.id, s.id1, flatten(s.list) fl from `DRILL-2013.json` s where s.id='02';
