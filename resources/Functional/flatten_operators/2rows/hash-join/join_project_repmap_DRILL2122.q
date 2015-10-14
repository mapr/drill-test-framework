select t1.uid, t1.events from  `DRILL-2122-1.json` t1, `DRILL-2122-2.json` t2 where t1.uid = t2.uid1;
