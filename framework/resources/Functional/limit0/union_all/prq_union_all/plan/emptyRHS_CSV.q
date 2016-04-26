explain plan for select * from ( SELECT col1 from `notEmpty_csv_v` UNION ALL SELECT cast(columns[0] as int) FROM `emptyFiles/empty_1.csv` ) t limit 0;
