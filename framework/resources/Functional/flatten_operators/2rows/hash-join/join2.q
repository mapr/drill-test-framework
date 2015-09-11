select * from `data.json` t1 inner join `data.json` t2 on t1.events[0].campaign_id = t2.events[4].campaign_id;
