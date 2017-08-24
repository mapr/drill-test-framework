select regexp_replace(cast(columns[2] as VARCHAR(4)), 'a', 'b') from `t1.csv`;
