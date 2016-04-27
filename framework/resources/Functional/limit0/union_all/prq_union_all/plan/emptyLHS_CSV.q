explain plan for select * from ( SELECT cast(columns[0] as int) FROM `emptyFiles/empty_1.csv` UNION ALL SELECT col1 FROM notEmpty_csv_v ) t limit 0;
