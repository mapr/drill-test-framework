alter session set `exec.hashjoin.enable.runtime_filter` = true;
alter session set `exec.hashjoin.runtime_filter.max.waiting.time` = 10000;

select
  p.p_mfgr,
  p.p_type,
  count(*) as num_parts
from
  supplier s,
  part p,
  partsupp ps,
  nation n
where
  n.n_nationkey = 15
  and n.n_nationkey = s.s_nationkey
  and s.s_suppkey = ps.ps_suppkey
  and ps.ps_partkey = p.p_partkey
  and p.p_type like '%STEEL%'
group by
  p.p_mfgr,
  p.p_type
order by
  p.p_mfgr,
  p.p_type;

alter session reset `exec.hashjoin.enable.runtime_filter`;
alter session reset `exec.hashjoin.runtime_filter.max.waiting.time`;