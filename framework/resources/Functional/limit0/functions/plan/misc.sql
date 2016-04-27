explain plan for select * from (
SELECT DATE '2008-2-23',
       TIME '12:23:34', 
       TIMESTAMP '2008-2-23 12:23:34.456', 
       INTERVAL '1' YEAR, INTERVAL '2' DAY, 
       DATE_ADD(DATE '2008-2-23', INTERVAL '1 10:20:30' DAY TO SECOND), 
       DATE_ADD(DATE '2010-2-23', 1)
from j1) t limit 0;
