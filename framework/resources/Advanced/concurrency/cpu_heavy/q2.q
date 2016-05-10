Select  count(*)  from lineitem_nocompression_256 
where
    ( 
        l_tax in (0.02,0.06,0.04,0.05,0.0,0.07,0.08,0.03,0.01) 
        and l_linestatus='F'
    )    
    or (
        ( length(l_comment) between 0 and 50) 
        and (
            substr(l_shipmode, 1,2)='R' 
            or substr(l_shipmode, 1,2)='A' 
            and l_tax > 0.05
        )
    )    
    or (
        (  l_extendedprice between 10000.0 and 100000.0 ) 
        and l_linestatus='O'
    )    
    or (
        l_extendedprice*l_discount*l_tax < 45.00 
        and l_shipdate > date '1996-03-13' + interval '1' year
    )    
    or (
        l_commitdate in (
            date '1996-02-12', date '1996-02-28', date '1996-03-05', date '1996-03-30', date '1996-03-14', date '1996-02-07', date '1997-01-14', date '1994-01-04'
        ) 
        and l_tax in (
            0.02,0.06,0.04,0.05,0.0,0.07,0.08,0.03,0.01
        ) 
        and length(l_comment) > 15
    )    
    or (
        position('con' in regexp_replace(l_comment, 'm.*ne', 'iconic')) > 10 
        and (
            length(regexp_replace(concat(lower(l_shipinstruct), lower(l_shipmode), l_comment), 'd.*ne', '')) > 0 
            or l_orderkey>50000 
            or l_partkey>1500 
            or l_linenumber=7
        )
    );
