select age(sql_to_date('Tuesday March 28, 2017','Day Month DD, YYY'),sql_to_date('28Feb2016', 'ddmonyyyy')) from (values(1));
