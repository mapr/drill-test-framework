select CONVERT_FROM(a.`v`.`e0`, 'UTF8') as k, count(a.`v`.`e0`) p from browser_action2 a where a.row_key > '0'  group by a.`v`.`e0` order by a.`v`.`e0`;
