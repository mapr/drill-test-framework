select div(cast(twocf['age'] as integer),row_key) div from voter where row_key < 11 order by div;
