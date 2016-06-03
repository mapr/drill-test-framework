alter session set `store.json.all_text_mode` = true;
select a, c, count(*) from `complex/drill-4479/mostlynulls.json` group by a, c;
alter session set `store.json.all_text_mode` = false;
