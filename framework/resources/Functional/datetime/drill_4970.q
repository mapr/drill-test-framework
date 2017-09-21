select count(*) as c from (values(-255.0)) as t(double_id) where (cast(double_id as int) >= -255 and double_id <= -5) or (double_id <= -256);
