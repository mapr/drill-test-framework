explain plan for select * from ( select initcap(name), initcap(registration) from voter_parquet where registration not in ('democrat', 'republican', 'independent') ) t limit 0;
