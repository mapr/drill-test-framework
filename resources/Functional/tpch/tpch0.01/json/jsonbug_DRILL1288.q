select
      s.s_suppkey,
      s.s_nationkey,
      n.n_name
    from
      supplier s,
      nation n
    where
      s.s_nationkey = n.n_nationkey order by s.s_suppkey desc limit 1;
