--keep partition 1.  Count is 17.
explain plan for select count(*) from orders_parts where int_id in (-3026, -3025, -3024, -3023, -3022, -3021, -3020, -3019, -3018, -3017, -3016, -3015, -3014, -3013, -3012, -3011, -3010, -3009, -3008);
