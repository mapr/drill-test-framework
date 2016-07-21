select filename,suffix,fqn,filepath,date_time from `min_max_dir/20*` where to_date(date_time) < '2014-03-11';
