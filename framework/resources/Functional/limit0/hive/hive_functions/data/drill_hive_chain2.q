select char_length(cast(nvl(int_col, 5) as varchar(3))) from hive.crosssources.fewtypes_null_hive;
