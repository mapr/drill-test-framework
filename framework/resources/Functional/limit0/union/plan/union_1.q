explain plan for select * from ( SELECT c1, c2, c3, c4, c5, c6, c7, c8, c9 FROM `union_01_v` UNION SELECT c1, c2, c3, c4, c5, c6, c7, c8, c9 FROM `union_02_v` ) t limit 0;
