select cast(convert_to(tbl.x.y, 'JSON') as varchar(30)) from `input2.json` tbl;
