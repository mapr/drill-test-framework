explain plan for select * from (
select concat(cast(voter.twocf.age as integer),convert_from(voter.onecf.name, 'UTF8'),cast(voter.twocf.registration as varchar(20)),cast(voter.threecf.contributions as double)) from voter where row_key=102) t limit 0;
