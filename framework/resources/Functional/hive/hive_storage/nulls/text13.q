select concat(min(distinct varchar_col), '1') from null_schemachange where varchar_col is null;
