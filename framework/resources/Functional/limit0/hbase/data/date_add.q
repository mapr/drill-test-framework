select date_add(cast(fourcf['create_date'] as timestamp), interval '3' hour) from voter where row_key=5;
