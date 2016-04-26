SELECT cast(key as varchar(42)) FROM `emptyFiles/empty_1.json` UNION ALL SELECT cast(key as character varying(42)) FROM `notEmptyFolder/notEmpty.json`;
