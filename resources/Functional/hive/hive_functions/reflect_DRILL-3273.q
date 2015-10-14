SELECT reflect('java.lang.String', 'valueOf', float_col),
       reflect('java.lang.String', 'isEmpty'),
       reflect('java.lang.Math', 'max', 66, 23),
       reflect('java.lang.Math', 'min', 2, 3),
       reflect('java.lang.Math', 'round', float_col),
       reflect('java.lang.Math', 'exp', 1.0),
       reflect('java.lang.Math', 'floor', double_col)
from hive.crosssources.fewtypes_null_hive;
