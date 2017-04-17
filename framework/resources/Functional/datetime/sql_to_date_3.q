select sql_to_date('Wed March 29, 2017','dy Month DD, YYYY'),sql_to_date('Wed March/29/2017','Dy Month/DD/YYYY'), sql_to_date('Wed March-29-17','DY Month-DD-YY') from (values(1));
