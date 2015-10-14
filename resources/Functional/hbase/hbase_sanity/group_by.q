select cast(voter.onecf.name as varchar(30)) name, count(*) unique_name from voter group by voter.onecf.name having count(*) > 3 order by voter.onecf.name;
