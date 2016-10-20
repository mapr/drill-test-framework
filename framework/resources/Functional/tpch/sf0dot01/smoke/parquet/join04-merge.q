alter session set `planner.enable_hashjoin` = false;
select count(*) 
    from part p1, part p2 
    where p1.p_name = p2.p_name 
	and p1.p_mfgr = p2.p_mfgr;
alter session set `planner.enable_hashjoin` = true;
