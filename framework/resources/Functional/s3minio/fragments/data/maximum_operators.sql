SET planner.width.max_per_node=100;
SET planner.slice_target=1;
SET planner.enable_multiphase_agg=false;
SELECT decimal_big.DECIMAL_15_5
FROM s3minio.tmp.`big_files/T_DECIMAL_BIG` decimal_big
JOIN `s3minio.tmp`.`big_files/T_DECIMAL_BIG_ZERO_PREC` decimal_big_zero_prec
  ON decimal_big.ID = decimal_big_zero_prec.ID
  AND decimal_big.ID > 2
JOIN s3minio.tmp.`big_files/T_DECIMAL_BIG_ZERO_SCALE` decimal_big_zero_scale
  ON decimal_big_zero_scale.ID = decimal_big.ID
WHERE decimal_big.ID < 14
UNION
SELECT CAST(decimal_big_tsv.columns[4] as DECIMAL(15, 5)) DECIMAL_15_5
FROM `s3minio.tmp`.`big_files/decimal_big.tsv` decimal_big_tsv
JOIN `s3minio`.`tmp`.`big_files/decimal_big_zero_scale.tsv` decimal_big_zero_scale_tsv
  ON CAST(decimal_big_tsv.columns[0] as INT) = CAST(decimal_big_zero_scale_tsv.columns[0] as INT)
  AND CAST(decimal_big_zero_scale_tsv.columns[0] as INT) > 2
JOIN s3minio.tmp.`big_files/T_DECIMAL_BIG_ZERO_PREC` second_decimal_big_zero_prec
  ON second_decimal_big_zero_prec.ID = CAST(decimal_big_tsv.columns[0] as INT)
WHERE CAST(decimal_big_tsv.columns[0] as INT) < 15;
RESET planner.width.max_per_node;
RESET planner.slice_target;
RESET planner.enable_multiphase_agg;
