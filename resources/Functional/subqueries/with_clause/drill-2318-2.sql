WITH
     x
     AS (SELECT  
                a1
         FROM  
                t1)
SELECT  x.a1    
FROM    x
WHERE	x.a1 IS NOT NULL
ORDER  BY 
        x.a1 desc;
