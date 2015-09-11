select rankings.pageRank pagerank from `dfs/parquet/rankings/` rankings inner join hive.uservisits uservisits on rankings.pageURL = uservisits.destinationurl;
