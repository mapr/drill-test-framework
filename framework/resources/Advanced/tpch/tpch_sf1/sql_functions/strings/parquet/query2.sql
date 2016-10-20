select cast(L_COMMITDate as date), cast(L_SHIPDate as date) from lineitem where L_SHIPMODE = 'TRUCK' and (cast(L_SHIPDate as date) between date '1996-03-10' and date '1996-03-15');
