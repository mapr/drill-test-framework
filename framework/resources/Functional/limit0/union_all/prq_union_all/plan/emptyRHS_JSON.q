explain plan for select * from ( SELECT cast(key as varchar(42)) FROM `notEmptyFolder/notEmpty.json` UNION ALL SELECT cast(key as varchar(42)) from `emptyFiles/empty_2.json` ) t limit 0;
