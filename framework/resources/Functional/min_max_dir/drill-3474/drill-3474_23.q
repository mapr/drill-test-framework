select *,filename,suffix,fqn,filepath from `drill-3474` where filename like '%voter10%' order by voter_id,filename,suffix,fqn,filepath;
