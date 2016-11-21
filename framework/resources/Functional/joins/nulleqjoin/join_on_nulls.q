select l.col2 , r.col1
from lallnulls l, rallnulls r
where l.col1 = r.col2 OR ( l.col1 IS NULL AND r.col2 IS NULL);
