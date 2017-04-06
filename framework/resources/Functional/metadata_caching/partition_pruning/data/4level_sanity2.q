select p_partkey, p_name, p_mfgr, p_brand, p_type, p_size, p_container, p_retailprice, p_comment from p_4level where dir0=1992 and dir1=2 and dir2=1 and dir3 IN (1,2) and p_size < 2;
