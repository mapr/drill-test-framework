-- expected: values read straight from simple_with_datatypes.xml
select int_field, bigint_field, float_field, double_field, boolean_field, date_field from table(`drill-1.22-delta/xml/simple_with_datatypes.xml`(type => 'xml', dataLevel => 2, allTextMode => 'false'))
