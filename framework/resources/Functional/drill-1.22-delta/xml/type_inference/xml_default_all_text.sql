-- expected: default allTextMode=true (dataLevel 2 = one row per <row>) -> every field VARCHAR (pre-1.22 behaviour kept)
select typeof(int_field) a, typeof(boolean_field) b from table(`drill-1.22-delta/xml/simple_with_datatypes.xml`(type => 'xml', dataLevel => 2)) limit 1
