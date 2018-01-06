use dfs_test.drillTestDirImpersonation;
select v.c1, b.c2, b.c3, v.c4 from user1datanoaccessv1 v, user1datanoaccessb1 b where v.c1 = b.c2;
select 1 from sys.version;
