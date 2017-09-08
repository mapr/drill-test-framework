select t1.columns[0], t2.columns[0] from `psv/empty/emptya.tbl` as t1 JOIN `psv/empty/emptyb.tbl` as t2 ON t1.columns[0]=t2.columns[0];
