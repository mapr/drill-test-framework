select initcap(name), initcap(registration) from `voter1.parquet` where registration not in ('democrat', 'republican', 'independent');
