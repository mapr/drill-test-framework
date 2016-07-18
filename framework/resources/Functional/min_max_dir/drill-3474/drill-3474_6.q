select filename, fqn, suffix, filepath, count(*) from `min_max_dir` group by filename,fqn,suffix,filepath having count(*) > 10;
