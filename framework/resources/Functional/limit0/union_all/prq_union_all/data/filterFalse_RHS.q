( SELECT key FROM `notEmptyFolder/notEmpty.json` LIMIT 0 ) UNION ALL ( SELECT key FROM `notEmptyFolder/notEmpty.json` WHERE 1=0 );
