alter session set `store.json.all_text_mode`=true;
SELECT t.c1, t.c2, t.c3, t.c4, t.c5, t.c6, t.c7, t.c8, t.c9 FROM `json_storage/f_20160316.json` t WHERE t.c1 IS NOT NULL OR t.c2 IS NOT NULL OR t.c3 IS NOT NULL OR t.c4 IS NOT NULL OR t.c5 IS NOT NULL OR t.c6 IS NOT NULL OR t.c7 IS NOT NULL OR t.c8 IS NOT NULL OR t.c9 IS NOT NULL;
alter session set `store.json.all_text_mode`=false;
