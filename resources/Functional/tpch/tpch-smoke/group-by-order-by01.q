select p.p_mfgr as mfgr, count(*) as mycount
   from part p 
   where p.p_size < 100 
              and p.p_type like '%NICKEL' 
group by p.p_mfgr 
order by 1;
