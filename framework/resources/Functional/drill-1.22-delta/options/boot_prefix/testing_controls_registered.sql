-- expected: DRILL-8502 registers drill.exec.testing.controls unconditionally (was assertions-only); default value {}
select name, val from sys.options where name = 'drill.exec.testing.controls'
