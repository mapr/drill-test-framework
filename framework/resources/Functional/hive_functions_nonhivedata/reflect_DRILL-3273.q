SELECT reflect('java.lang.String', 'valueOf', columns[7]),
       reflect('java.lang.String', 'isEmpty'),
       reflect('java.lang.Math', 'max', 66, 23),
       reflect('java.lang.Math', 'min', 2, 3),
       reflect('java.lang.Math', 'round', cast(case when columns[7]='null' then null else columns[7] end as double)),
       reflect('java.lang.Math', 'exp', cast(1.0 as double)),
       reflect('java.lang.Math', 'floor', cast(case when columns[8]='null' then null else columns[8] end as double))
from `fewtypes_null.tbl`;
