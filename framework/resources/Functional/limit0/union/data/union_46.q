SELECT c5, c6, c9 FROM (SELECT c5, c6, c9 FROM `union_01_v` UNION SELECT c5, c6, c9 FROM `union_02_v`) tmp WHERE c5 IS NOT null AND c6 IS NOT null;
