alter session set `store.json.all_text_mode` = true;
select c1 from `complex/drill-4479/mostlynulls.json`;
alter session set `store.json.all_text_mode` = false;
