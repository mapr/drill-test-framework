select count(*) from (
  select max(length(concat(str1,str2))) max_length from (
    select
        substring(regexp_replace(s.enlarged_comment, 'iron..', 'iconic'), 4) str1,
        substring(regexp_replace(s.enlarged_comment, 'm.*ne', 'iconic'), 4) str2
    from (
        select
            concat(o_comment, o_comment, o_comment, o_comment, o_comment, o_comment,      o_comment, o_comment, o_comment, o_comment, o_comment, o_comment, o_comment,  o_comment, o_comment) enlarged_comment,
            o_orderdate,
            concat(o_clerk, '...') o_clerk
        from orders_nocompression_256
        where o_orderdate > date '1900-01-01' + interval '1' year
      ) s
      where
          position('...' in o_clerk) > 0
          and length(concat(enlarged_comment, o_clerk)) > 100
  ) s1
)s2 where max_length = 0;
