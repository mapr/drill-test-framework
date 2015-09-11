create table dfs.ctas_flatten.`hashfilter25_ctas` as select flatten(events), flatten(events), e1, events from (select flatten(events) e1, events from `data.json`) sub where sub.e1.campaign_id = 'c2';
select * from dfs.ctas_flatten.`hashfilter25_ctas`;
select 1 from sys.version;
