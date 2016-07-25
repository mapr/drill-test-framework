select a.suffix,b.suffix,a.filepath,b.filepath, a.name from `min_max_dir/2005` a join `min_max_dir/2016` b on (a.suffix=b.suffix) and a.name > 'yuri king';
