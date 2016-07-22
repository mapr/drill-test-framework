select dir0,dir1,filename,fqn,filepath,suffix,cast(columns[3] as varchar(20)) from `drill-3474/*/May` where cast(columns[3] as varchar(20))='democrat';
