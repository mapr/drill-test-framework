SELECT c1, c2, c3, c4, c5, c6, c7, c8, c9 FROM `union_01_v` WHERE c1 NOT in (-1,0,1,99999.99,402) UNION SELECT c1, c2, c3, c4, c5, c6, c7, c8, c9 FROM `union_02_v` WHERE c1 NOT in (-1,0,1,99999.99);
