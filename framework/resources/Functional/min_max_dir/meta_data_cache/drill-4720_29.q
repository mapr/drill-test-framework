SELECT distinct(dir2), count(*) FROM `min_max_dir_metadatacache` WHERE dir0 = MAXDIR('dfs.drillTestDir','min_max_dir_metadatacache') group by dir2;
