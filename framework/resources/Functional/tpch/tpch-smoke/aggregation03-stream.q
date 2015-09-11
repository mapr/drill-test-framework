select p_mfgr as mfgr, count(*) as mycount 
	from part 
		where p_mfgr = 'Manufacturer#3' 
group by p_mfgr;
