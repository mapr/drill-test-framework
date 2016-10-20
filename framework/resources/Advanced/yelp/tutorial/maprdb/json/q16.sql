select celltbl.catl, count(celltbl.catl) categorycnt from (select flatten(categories) catl from business )  celltbl group by celltbl.catl order by count(celltbl.catl) desc limit 10 ;
