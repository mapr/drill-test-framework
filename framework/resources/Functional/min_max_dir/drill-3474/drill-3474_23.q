select dir0,dir1,columns,filename,suffix,fqn,filepath from `drill-3474` where filename like '%voter10%' order by filename,suffix,fqn,filepath;
