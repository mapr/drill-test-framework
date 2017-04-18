select sql_to_time('10:13:00.44','HH:MI:SS.MS'), sql_to_time('10:13:25','HH12:MI:SS'), sql_to_time('21:13:25:15','HH24:MI:SS:MS') from (values(1));
