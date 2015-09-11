select
        count(*)
from    j1 LEFT OUTER JOIN j3
        ON  (
            case when j1.c_integer IS NULL then 0 else j1.c_integer end = j3.c_integer
	    AND case when j1.c_varchar IS NULL then 'XXXX XXXXXX XXXXX' else j1.c_varchar end = j3.c_varchar
            AND case when j1.c_bigint > 1000 then 1 else 0 end = case when j3.c_bigint > 1000 then 1 else 0 end
            AND CAST(case when j1.c_integer IN (10000) then 0 else 1 end as BIGINT ) = case when j3.c_bigint <> 0 then 0 else 1 end
            )
;
