CREATE TABLE widecolumns (
    id INTEGER,
    str_fixed varchar(100),
    str_var varchar(10),
    bool boolean,
    binary_fixed char,
    binary_var varchar(50),
    tinyint_var INTEGER,
    smallint_var INTEGER,
    int_var INTEGER,
    bigint_var BIGINT,
    allints BIGINT,
    dec_var_prec38_sc15 DECIMAL(38, 15),
    dec_var_prec38_sc0 DECIMAL(38, 0),
    dec_var_prec38_sc38 DECIMAL(38, 38),
    dec_var_prec36_sc4 DECIMAL(36, 4),
    dec_var_prec28_sc10 DECIMAL(28, 10),
    dec_var_prec28_sc0 DECIMAL(28, 0),
    dec_var_prec28_sc28 DECIMAL(28, 28),
    dec_var_prec19_sc2 DECIMAL(19, 2),
    dec_var_prec18_sc17 DECIMAL(18, 17),
    dec_var_prec18_sc0 DECIMAL(18, 0),
    dec_var_prec18_sc18 DECIMAL(18, 18),
    dec_var_prec17_sc3 DECIMAL(17, 3),
    dec_var_prec9_sc2 DECIMAL(9, 2),
    dec_var_prec9_sc0 DECIMAL(9, 0),
    dec_var_prec9_sc9 DECIMAL(9, 9),
    dec_var_prec5_sc2 DECIMAL(5, 2),
    float_var_prec82_sc44 FLOAT,
    float_var_prec44_sc44 FLOAT,
    float_var_prec38_sc0 FLOAT,
    float_fixed_prec82_sc44 FLOAT,
    float_fixed_prec38_sc0 FLOAT,
    double_var_prec632_sc324 DOUBLE PRECISION,
    double_var_prec324_sc324 DOUBLE PRECISION,
    double_var_prec308_sc0 DOUBLE PRECISION,
    double_fixed_prec632_sc324 DOUBLE PRECISION,
    double_fixed_prec308_sc0 DOUBLE PRECISION,
    ts_millis TIMESTAMP,
    ts TIMESTAMP(0),
    ts_mixed TIMESTAMP,
    dt DATE,
    tm_millis TIME,
    tm TIME,
    tm_mixed TIME
);

create table widestrings ( id INTEGER, str_fixed varchar(100), str_var varchar(100), str_null varchar(100), str_empty varchar(100), str_empty_null varchar(100), str_var_null_empty varchar(100), str_fixed_null_empty varchar(100), tinyint_var integer, dec_var_prec5_sc2 decimal(5,2));


create table widestrings ( id INTEGER, str_fixed varchar(1000), str_var varchar(1000), str_empty varchar(1000), str_null varchar(1000), str_empty_null varchar(1000), str_var_null_empty varchar(1000), str_fixed_null_empty varchar(1000), tinyint_var integer, dec_var_prec5_sc2 decimal(5,2));




select cast(id as int) id, cast(str_fixed as varchar(100)) str_fixed, cast(str_var as varchar(100)) str_var, cast(str_null as varchar(100)) str_null, cast(str_empty as varchar(100)) str_empty, cast(str_empty_null as varchar(100)) str_empty_null, cast(str_var_null_empty as varchar(100)) str_var_null_empty, cast(str_fixed_null_empty as varchar(100)) str_fixed_null_empty, cast(tinyint_var as int) tinyint_var, cast(dec_var_prec5_sc2 as decimal(5,2)) dec_var_prec5_sc2 from `data-shapes/wide-columns/flat/wide-strings.json`;
