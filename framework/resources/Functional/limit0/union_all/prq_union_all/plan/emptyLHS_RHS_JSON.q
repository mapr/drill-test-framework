explain plan for select * from ( SELECT cast(key as int) from `emptyFiles/empty_1.json` UNION ALL SELECT cast(key as integer) from `emptyFiles/empty_2.json` ) t limit 0;
