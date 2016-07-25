SELECT a.suffix,b.suffix,a.fqn,b.fqn,a.filepath,b.filepath,a.age from `min_max_dir/1985` a right outer join `min_max_dir/2016` b on (a.filename=b.filename) where a.age > 70;
