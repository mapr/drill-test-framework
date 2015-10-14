create table `data-shapes/wide-columns/flat/alltypes` as
select 
    cast(columns[0] as INT) id,
    cast(columns[1] as VARCHAR(100000)) str_fixed,  
    cast(columns[2] as VARCHAR(1000000)) str_var, 
    cast(columns[3] as boolean) bool, 
    cast(columns[4] as varchar(100000)) binary_fixed, 
    cast(columns[5] as varchar(1000000)) binary_var, 
    cast(columns[6] as INT) tinyint_var, 
    cast(columns[7] as INT) smallint_var, 
    cast(columns[8] as INT) int_var, 
    cast(columns[9] as BIGINT) bigint_var, 
    cast(columns[10] as BIGINT) allints, 
    cast(columns[11] as DECIMAL(38, 15)) dec_var_prec38_sc15, 
    cast(columns[12] as DECIMAL(38, 0)) dec_var_prec38_sc0, 
    cast(columns[13] as DECIMAL(38, 38)) dec_var_prec38_sc38, 
    cast(columns[14] as DECIMAL(36, 4)) dec_var_prec36_sc4,
    cast(columns[15] as DECIMAL(28, 10)) dec_var_prec28_sc10, 
    cast(columns[16] as DECIMAL(28, 0)) dec_var_prec28_sc0, 
    cast(columns[17] as DECIMAL(28, 28)) dec_var_prec28_sc28, 
    cast(columns[18] as DECIMAL(19, 2)) dec_var_prec19_sc2, 
    cast(columns[19] as DECIMAL(18, 17)) dec_var_prec18_sc17, 
    cast(columns[20] as DECIMAL(18, 0)) dec_var_prec18_sc0, 
    cast(columns[21] as DECIMAL(18, 18)) dec_var_prec18_sc18, 
    cast(columns[22] as DECIMAL(17, 3)) dec_var_prec17_sc3, 
    cast(columns[23] as DECIMAL(9, 2)) dec_var_prec9_sc2, 
    cast(columns[24] as DECIMAL(9, 0)) dec_var_prec9_sc0, 
    cast(columns[25] as DECIMAL(9, 9)) dec_var_prec9_sc9, 
    cast(columns[26] as DECIMAL(5, 2)) dec_var_prec5_sc2,
    cast(columns[27] as FLOAT) float_var_prec82_sc44,
    cast(columns[28] as FLOAT) float_var_prec44_sc44,
    cast(columns[29] as FLOAT) float_var_prec38_sc0,
    cast(columns[30] as FLOAT) float_fixed_prec82_sc44,
    cast(columns[31] as FLOAT) float_fixed_prec38_sc0,
    cast(columns[32] as DOUBLE) double_var_prec632_sc324,
    cast(columns[33] as DOUBLE) double_var_prec324_sc324,
    cast(columns[34] as DOUBLE) double_var_prec308_sc0,
    cast(columns[35] as DOUBLE) double_fixed_prec632_sc324,
    cast(columns[36] as DOUBLE) double_fixed_prec308_sc0,
    cast(columns[37] as TIMESTAMP) ts_millis,
    cast(columns[38] as TIMESTAMP) ts,
    cast(columns[39] as TIMESTAMP) ts_mixed,
    cast(columns[40] as DATE) dt,
    cast(columns[41] as TIME) tm_millis,
    cast(columns[42] as TIME) tm,
    cast(columns[43] as TIME) tm_mixed 
from `data-shapes/wide-columns/flat/alltypes.tbl`;


select * from `data-shapes/wide-columns/flat/alltypes.tbl`;

select * from `data-shapes/wide-columns/flat/alltypes.parquet`

select length(str_fixed) from `data-shapes/wide-columns/flat/alltypes.parquet`;
select length(str_var) from `data-shapes/wide-columns/flat/alltypes.parquet`;
select * from `data-shapes/wide-columns/flat/alltypes.parquet` where str_fixed like '%Abc%';
select * from `data-shapes/wide-columns/flat/alltypes.parquet` where str_var like '%Abc%';
select * from `data-shapes/wide-columns/flat/alltypes.parquet` where str_fixed not like '%Abc%';
select * from `data-shapes/wide-columns/flat/alltypes.parquet` where str_var not like '%Abc%';
select * from `data-shapes/wide-columns/flat/alltypes.parquet` where str_fixed similar to '%(Abc|abc|aBc|abC|ABC)%';
select * from `data-shapes/wide-columns/flat/alltypes.parquet` where str_fixed similar to '%(Abc|abc|aBc|abC|ABC)%';
select * from `data-shapes/wide-columns/flat/alltypes.parquet` where str_fixed not similar to '%(Abc|abc|aBc|abC|ABC)%';
select * from `data-shapes/wide-columns/flat/alltypes.parquet` where str_var not similar to '%(Abc|abc|aBc|abC|ABC)%';
select locate('ab', str_fixed) from `data-shapes/wide-columns/flat/alltypes.parquet`;
select repeat(str_fixed, 2) from `data-shapes/wide-columns/flat/alltypes.parquet`;
select repeat(str_var, 2) from `data-shapes/wide-columns/flat/alltypes.parquet`;

-- WHERE --
SELECT * FROM `data-shapes/wide-columns/flat/alltypes.parquet` WHERE abs(mod(double_fixed_prec632_sc324, double_var_prec632_sc324))>1.90821893749870123E120;
SELECT * FROM `data-shapes/wide-columns/flat/alltypes.parquet` WHERE abs(mod(dec_var_prec38_sc0, dec_var_prec38_sc15))=0;
SELECT * FROM `data-shapes/wide-columns/flat/alltypes.parquet` WHERE mod(float_fixed_prec38_sc0, float_fixed_prec82_sc44)<=10.8376492E36;
SELECT (float_fixed_prec38_sc0-float_fixed_prec82_sc44) FROM `data-shapes/wide-columns/flat/alltypes.parquet` WHERE (float_fixed_prec38_sc0/float_fixed_prec82_sc44)<=1;
SELECT ((float_fixed_prec38_sc0-float_fixed_prec82_sc44)/(float_fixed_prec38_sc0+float_fixed_prec82_sc44)) FROM `data-shapes/wide-columns/flat/alltypes.parquet` WHERE ROUND((float_fixed_prec38_sc0/float_fixed_prec82_sc44))<>1;

-- MATH --
select (dec_var_prec38_sc38 * dec_var_prec38_sc0) var1 from `data-shapes/wide-columns/flat/alltypes.parquet`;
select (dec_var_prec38_sc15+dec_var_prec38_sc0+dec_var_prec38_sc38+dec_var_prec36_sc4+dec_var_prec28_sc10+dec_var_prec28_sc0+dec_var_prec28_sc28+dec_var_prec19_sc2+dec_var_prec18_sc17+dec_var_prec18_sc0+dec_var_prec18_sc18+dec_var_prec17_sc3+dec_var_prec9_sc2+dec_var_prec9_sc0+dec_var_prec9_sc9+dec_var_prec5_sc2+float_var_prec82_sc44+float_var_prec44_sc44+float_var_prec38_sc0+float_fixed_prec82_sc44+float_fixed_prec38_sc0+double_var_prec324_sc324) from `data-shapes/wide-columns/flat/alltypes.parquet`;
select (dec_var_prec38_sc15-dec_var_prec38_sc0-dec_var_prec38_sc38-dec_var_prec36_sc4-dec_var_prec28_sc10-dec_var_prec28_sc0-dec_var_prec28_sc28-dec_var_prec19_sc2-dec_var_prec18_sc17-dec_var_prec18_sc0-dec_var_prec18_sc18-dec_var_prec17_sc3-dec_var_prec9_sc2-dec_var_prec9_sc0-dec_var_prec9_sc9-dec_var_prec5_sc2-float_var_prec82_sc44-float_var_prec44_sc44-float_var_prec38_sc0-float_fixed_prec82_sc44-float_fixed_prec38_sc0-double_var_prec324_sc324) from `data-shapes/wide-columns/flat/alltypes.parquet`;
select bigint_var/allints from `data-shapes/wide-columns/flat/alltypes.parquet`;
select allints/dec_var_prec38_sc15 from `data-shapes/wide-columns/flat/alltypes.parquet`;
select allints+dec_var_prec38_sc15 from `data-shapes/wide-columns/flat/alltypes.parquet`;
select dec_var_prec28_sc10*float_var_prec82_sc44 from `data-shapes/wide-columns/flat/alltypes.parquet`;
select dec_var_prec9_sc0*dec_var_prec9_sc0 from `data-shapes/wide-columns/flat/alltypes.parquet`;
select double_var_prec324_sc324*float_var_prec38_sc0*dec_var_prec38_sc15 from `data-shapes/wide-columns/flat/alltypes.parquet`;

-- ORDER BY --
select * from `data-shapes/wide-columns/flat/alltypes.parquet` order by str_fixed;
select * from `data-shapes/wide-columns/flat/alltypes.parquet` order by allints;
select * from `data-shapes/wide-columns/flat/alltypes.parquet` order by length(str_var);
select * from `data-shapes/wide-columns/flat/alltypes.parquet` order by dec_var_prec38_sc15+float_var_prec82_sc44+double_var_prec632_sc324;


-- GROUP BY --
select count(*) from `data-shapes/wide-columns/flat/alltypes.parquet` group by str_fixed;
select count(*) from `data-shapes/wide-columns/flat/alltypes.parquet` group by str_var;
select max(length(str_var)) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(double_var_prec632_sc324) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(double_var_prec632_sc324) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(dec_var_prec38_sc15) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(dec_var_prec38_sc15) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(dec_var_prec38_sc0) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(dec_var_prec38_sc0) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(dec_var_prec38_sc38) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(dec_var_prec38_sc38) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(dec_var_prec36_sc4) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(dec_var_prec36_sc4) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(dec_var_prec28_sc10) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(dec_var_prec28_sc10) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(dec_var_prec28_sc0) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(dec_var_prec28_sc0) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(dec_var_prec28_sc28) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(dec_var_prec28_sc28) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(dec_var_prec19_sc2) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(dec_var_prec19_sc2) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(dec_var_prec18_sc17) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(dec_var_prec18_sc17) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(dec_var_prec18_sc0) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(dec_var_prec18_sc0) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(dec_var_prec18_sc18) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(dec_var_prec18_sc18) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(dec_var_prec17_sc3) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(dec_var_prec17_sc3) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(dec_var_prec9_sc2) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(dec_var_prec9_sc2) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(dec_var_prec9_sc0) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(dec_var_prec9_sc0) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(dec_var_prec9_sc9) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(dec_var_prec9_sc9) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(dec_var_prec5_sc2) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(dec_var_prec5_sc2) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(float_var_prec82_sc44) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(float_var_prec82_sc44) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(float_var_prec44_sc44) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(float_var_prec44_sc44) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(float_var_prec38_sc0) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(float_var_prec38_sc0) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(float_fixed_prec82_sc44) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(float_fixed_prec82_sc44) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(float_fixed_prec38_sc0) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(float_fixed_prec38_sc0) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(double_var_prec324_sc324) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(double_var_prec324_sc324) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(double_var_prec308_sc0) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(double_var_prec308_sc0) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(double_fixed_prec632_sc324) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(double_fixed_prec632_sc324) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(double_fixed_prec632_sc324) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(double_fixed_prec632_sc324) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;

select max(double_fixed_prec308_sc0) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;
select sum(double_fixed_prec308_sc0) from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var;


-- SubQueries --
select abs(mod(sub.double_sum,5)) mod_dbl, max(tinyint_var) from (select sum(double_var_prec632_sc324) double_sum, tinyint_var from `data-shapes/wide-columns/flat/alltypes.parquet` group by tinyint_var) sub group by abs(mod(sub.double_sum,5));


Failing:
select columns[0] from `data-shapes/like-charset.tbl` where columns[0] like '[aq]%';  DRILL-1831
select concat(str_fixed, str_var) from `data-shapes/wide-columns/flat/alltypes.parquet`;
select INSTR('ab', str_var) from `data-shapes/wide-columns/flat/alltypes.parquet`;
