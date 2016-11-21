SELECT t1.columns[4], t2.columns[4] 
FROM `typeall_r.csv` t1 INNER JOIN  `typeall_r.csv` t2 
ON (case when t1.columns[4] ='' then null else TO_DATE(t1.columns[4],'yyyy-MM-dd') end) = (case when t2.columns[4] ='' then null else TO_DATE(t2.columns[4],'yyyy-MM-dd') end)
OR (t1.columns[4] IS NULL AND t2.columns[4] IS NULL);
