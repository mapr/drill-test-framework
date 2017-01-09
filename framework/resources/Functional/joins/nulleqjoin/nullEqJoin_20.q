select t1.columns[0], t2.columns[0] 
from `oneColDupsWnulls.csv` t1 JOIN `oneColWOnulls.csv` t2 ON t1.columns[0] = t2.columns[0] OR ( t1.columns[0] IS NULL AND t2.columns[0] IS NULL );
